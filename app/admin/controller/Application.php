<?php
namespace app\admin\controller;

use app\admin\BaseController;
use think\facade\Db;

class Application extends BaseController
{
    public function getallapplication(){
        $data = Db::table('cm_application')
            ->alias('a')
            ->join(['cm_car'=>'c'],'a.carid=c.cid')
            ->join(['cm_user'=>'u'],'a.userid=u.uid')
            ->field('a.applyid,u.name,a.carid,c.type,c.license,a.apply_time,a.start_date,a.end_date,a.status')
            ->order('apply_time','desc')
            ->select();
        return jok('',$data);
    }

    public function pass($pk){
        $apply = new \app\model\Application();
        $apply->pass($pk);
        return jok('修改成功');
    }

    public function fail($pk){
        $apply = new \app\model\Application();
        $apply->fail($pk);
        return jok('修改成功');
    }
}