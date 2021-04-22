<?php


namespace app\test\controller;


use think\facade\Db;

class index
{
    public function index(){
        return 'index';
    }
    public function getlocation(){
        $subQuery = Db::table('cm_location')
            ->alias('l')
            ->join(['cm_car'=>'c'],'l.carid=c.cid')
            ->join(['cm_user'=>'u'],'l.userid=u.uid')
            ->where('c.userid','<>','null')
            ->field('c.license,c.type,u.uid,u.name,l.lng,l.lat,l.time')
            ->buildSql();
        $data = Db::table($subQuery . ' tmp')
            ->field('license,type,uid,name,lng,lat,MAX(time)')
            ->group('uid')
            ->select();
        return jok('',$data);
    }
}