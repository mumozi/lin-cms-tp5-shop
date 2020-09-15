<?php


namespace app\api\model;


use think\Db;
use think\Exception;
use think\model\concern\SoftDelete;

class Theme extends BaseModel
{
    use SoftDelete;
    protected $hidden = ['topic_img_id', 'head_img_id', 'delete_time', 'update_time'];

    public static function delTheme($ids)
    {
        Db::startTrans();
        try {
            self::destroy($ids);
            foreach ($ids as $id) {
                ThemeProduct::where('theme_id', $id)->delete();
            }
            Db::commit();
            return true;
        }catch (Exception $e){
            Db::rollback();
            return false;
        }
    }

    public function products()
    {
        // 等价于 return $this->belongsToMany('Product', 'theme_product', 'product_id', 'theme_id');
        return $this->belongsToMany('Product')->where('status', '=', 1);
    }

    public function topicImg()
    {
        return $this->belongsTo('Image', 'topic_img_id');
    }

    public function headImg()
    {
        return $this->belongsTo('Image', 'head_img_id');
    }
}
