<?php
namespace app\model;

use think\Model;

class Application extends Model
{
    protected $pk = 'applyid';

    public function pass($pk){
        $this->where([
            "applyid" => $pk,
        ])->update([
            'status' => 'pass'
        ]);
    }

    public function fail($pk){
        $this->where([
            "applyid" => $pk,
        ])->update([
            'status' => 'fail'
        ]);
    }
}