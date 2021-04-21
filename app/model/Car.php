<?php
namespace app\model;

use think\Model;

class Car extends Model
{
    protected $pk = 'cid';

    public function getallcar(){
        return $this->order('cid','asc')->select();
    }

    public function addcar($license,$brand,$price,$bought_time,$type){
        $data = [
            'license' => $license,
            'brand' => $brand,
            'price' => $price,
            'bought_time' => $bought_time,
            'type' => $type
        ];
        $this->insert($data);
        return true;
    }
}