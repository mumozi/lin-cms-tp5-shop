<?php


namespace app\api\service;
use app\api\model\Order as OrderModel;
use app\api\model\DeliverRecord as DeliverRecordModel;
use app\lib\exception\order\OrderException;
use app\lib\enum\OrderStatusEnum;
use app\lib\token\Token;
use think\Db;
use think\Exception;

class Order
{
    private $order;

    public function __construct($orderId)
    {
        // 根据传入的id查询出对应记录，拿到对应记录的模型实例
        $order = OrderModel::get($orderId);
        if (!$order) Throw new OrderException(['code' => 404, 'msg' => '指定的订单不存在']);
        $this->order = $order;
    }

    /**
     * @param string $company 快递公司编码
     * @param string $number 快递单号
     * @return bool
     */
    public function deliverGoods($company, $number)
    {
        // 判断订单的状态是否是已支付
        //1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足
        if($this->order->status == OrderStatusEnum::PAID){
            // 启动事务
            Db::startTrans();
            try {
                // 创建一条发货单记录
                DeliverRecordModel::create([
                    'order_no' => $this->order->order_no,
                    'comp' => $company,
                    'number' => $number,
                    'operator' => Token::getCurrentName()
                ]);
                // 改变订单状态
                $this->order->status = OrderStatusEnum::DELIVERED;
                // 调用模型save()方法更新记录
                $this->order->save();
                // 提交事务
                Db::commit();
                return true;
            } catch (Exception $ex) {
                // 回滚事务
                Db::rollback();
                throw new OrderException(['msg' => '订单发货不成功', 'error_code' => '70009']);
            }
        }else{
            Throw new OrderException(['msg' => '当前订单不允许发货，请检查订单状态', 'error_code' => '70008']);
        }

    }


}
