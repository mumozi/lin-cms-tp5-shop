<?php


namespace app\api\model;


use think\model\concern\SoftDelete;

class BannerItem extends BaseModel
{
    use SoftDelete;
    protected $hidden = ['delete_time'];

    public function img()
    {
        return $this->belongsTo('Image', 'img_id');
    }
}
