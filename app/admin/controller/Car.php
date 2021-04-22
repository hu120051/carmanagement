<?php
namespace app\admin\controller;


use app\admin\BaseController;
use think\facade\Db;


class Car extends  BaseController
{

    public function getallcar(){
        $car = new \app\model\Car();
        $data = $car->getallcar();
        return jok('',$data);
    }

    /**
     * 添加车辆
     *
     * @return \json
     */
    public function addcar(){
        $params=json_decode(file_get_contents("php://input"),true);
        $license = $params['license'];
        $brand = $params['brand'];
        $price = $params['price'];
        $bought_time = $params['bought_time'];
        $type = $params['type'];
        $car = new \app\model\Car();
        $result = $car->addcar($license,$brand,$price,$bought_time,$type);
        if($result){
            return jok('添加成功！');
        }
        return  jerr('添加失败！');
    }

    /**
     * 删除车辆
     *
     * @return \json
     */
    public function deletecar(){
        $params=json_decode(file_get_contents("php://input"),true);
        $pk = $params['pk'];
        $car = new \app\model\Car();
        $reslut = $data = $car->deletecarbypk($pk);
        if($reslut){
            return jok('删除成功!');
        }
        return jerr('未知错误，删除失败！','400');
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