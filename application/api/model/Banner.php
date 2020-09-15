<?php


namespace app\api\model;


use app\lib\exception\banner\BannerException;
use think\Db;
use think\Exception;
use think\model\concern\SoftDelete;

class Banner extends BaseModel
{
    //使用软删除
    use SoftDelete;

    protected $hidden = ['delete_time'];

    public function items()
    {
        //包含多个子项目分类的情况
//        return $this->hasMany('BannerItem', 'banner_id', 'id');
        //hasMany()方法中，第二个参数默认是当前模型的小写类名+_id，第三个参数默认是id
        return $this->hasMany('BannerItem');
    }

    public static function add($params)
    {
        //启动事务
        Db::startTrans();
        try {
            $banner = self::create($params, true);
            $banner->items()->saveAll($params['items']);
            //提交事务
            Db::commit();
        } catch (Exception $e) {
            //回滚事务
            Db::rollback();
            throw new BannerException([
                'msg' => '新增轮播图失败',
                'error_code' => 70001
            ]);
        }

    }
}
