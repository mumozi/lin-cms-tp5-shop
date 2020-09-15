<?php


namespace app\api\controller\v1;
use app\api\model\Order as OrderModel;
use app\api\service\Order as OrderService;

use think\facade\Request;

class Order
{
    /**
     * 分页查询所有订单记录
     * @validate('OrderForm')
     */
    public function getOrders()
    {
        $params = Request::get();
        $orders = OrderModel::getOrdersPaginate($params);
        if ($orders['total_nums'] === 0) {
            throw new OrderException([
                'code' => 404,
                'msg' => '未查询到相关订单',
                'error_code' => '70007'
            ]);
        }
        return $orders;
    }

    /**
     * 订单发货
     * @auth('订单发货','订单管理')
     * @param('id','订单id','require|number')
     * @param('comp','快递公司编码','require|alpha')
     * @param('number','快递单号','require|alphaNum')
     * @throws \app\lib\exception\order\OrderException
     */
    public function deliverGoods($id)
    {
        $params = Request::post();
        // $orderService = new OrderService($id);
        // $result = $orderService->deliverGoods($params['comp'], $params['number']);
        // 简写为
        $result = (new OrderService($id))->deliverGoods($params['comp'], $params['number']);

        return writeJson(201, $result, '发货成功');
    }
}
