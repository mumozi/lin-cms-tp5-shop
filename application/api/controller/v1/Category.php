<?php


namespace app\api\controller\v1;
use app\api\model\Category as CategoryModel;
use app\lib\exception\category\CategoryException;
use think\facade\Hook;
use think\facade\Request;

class Category
{
    public function getCategory()
    {
        $result = CategoryModel::with('img')->select();

        if ($result->isEmpty()) {
            throw new CategoryException([
                'code'=>404,
                'msg' => '没有查询到商品分类',
                'error_code' => 70003]);
        }
        return $result;
    }

    /**
     * 新增分类
     * @validate('CategoryForm')
     * @return \think\response\Json
     * @throws CategoryException
     */
    public function addCategory()
    {
        $params = Request::post();
        $category = CategoryModel::create($params, true);
        if ($category->isEmpty())
        {
            throw new CategoryException(['msg' => '商品分类创建失败', 'error_code' => 70004]);
        }
        return writeJson(201, [], '商品分类创建成功！');

    }

    /**
     * 更新指定分类信息
     * @validate('CategoryForm.edit')
     * @param $id
     * @return \think\response\Json
     * @throws CategoryException
     */
    public function updateCategory($id)
    {
        $params = Request::put();
        $category = CategoryModel::get($id);
        if($category->isEmpty())
        {
            throw new CategoryException([
                'code' => 404,
                'msg' => '指定id的分类不存在',
                'error_code' => 70003]);
        }
        // allowField(true)只允许写入数据表存在的字段
        $category->allowField(true)->save($params);
        return writeJson(201, [], '商品分类更新成功！');
    }

    /**
     * 删除商品分类
     * @auth('删除商品分类','商品管理')
     * @param('ids','待删除的商品分类id列表','require|array|min:1')
     */
    public function delCategory()
    {
        $ids = Request::delete('ids');
        // 执行软删除
        CategoryModel::destroy($ids);
        Hook::listen('logger', '删除了id为' . implode(',', $ids) . '的商品分类');

        return writeJson(201, [], '商品分类删除成功！');
    }
}
