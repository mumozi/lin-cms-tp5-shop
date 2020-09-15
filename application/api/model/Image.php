<?php


namespace app\api\model;


class Image extends BaseModel
{
    protected $hidden = ['delete_time', 'from', 'update_time'];
    /**
     * 我们要获取url这个字段,获取默认接收两个参数
     * @param $value 前这条记录里url字段的值
     * @param $data 前记录的完整数据
     * @return 前这条记录里url字段的值|string
     */
    public function getUrlAttr($value, $data)
    {
       return $this->prefixImgUrl($value, $data);
    }

}
