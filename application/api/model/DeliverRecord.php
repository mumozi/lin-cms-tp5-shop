<?php


namespace app\api\model;


class DeliverRecord extends BaseModel
{
    // 开启自动写入时间戳
    public $autoWriteTimestamp = true;
    // 隐藏字段显示
    protected $hidden = ['update_time'];
}
