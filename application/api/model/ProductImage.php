<?php


namespace app\api\model;


use think\model\concern\SoftDelete;

class ProductImage extends BaseModel
{
// 自动写入时间戳
    public $autoWriteTimestamp = true;
    protected $hidden = ['delete_time', 'product_id'];

    public function img()
    {
        return $this->belongsTo('Image', 'img_id');
    }
}
