<?php
namespace app\admin;


use think\App;

/**
 * 控制器基础类
 */
abstract class BaseController
{
    /**
     * Request实例
     * @var \think\Request
     */
    protected $request;

    /**
     * 应用实例
     * @var \think\App
     */
    protected $app;
    protected $module;
    protected $controller;
    protected $action;

    //模型
    protected $User;
    protected $Location;
    protected $Car;
    protected $CarUse;

    //主键key
    protected $pk = '';
    //表名称
    protected $table = '';
    //主键value
    protected $pk_value = '';


    /**
     * 构造方法
     * @access public
     * @param  App  $app  应用对象
     */
    public function __construct(App $app)
    {
        $this->app     = $app;
        $this->request = $this->app->request;

        // 控制器初始化
        $this->initialize();
    }

    /**
     *后台简单的身份判断
     *
     * @return void
     */
    public function access()
    {
        $callback = "/admin";
        $access_token = session('username');
        if (!$access_token) {
            return redirect('/admin/user/login/?callback=' . urlencode($callback));
        }
    }
}
