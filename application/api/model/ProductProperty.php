<?php


namespace app\api\model;


class ProductProperty extends BaseModel
{
    // 自动写入时间戳
    public $autoWriteTimestamp = true;
    protected $hidden = ['product_id', 'update_time', 'delete_time'];
}
