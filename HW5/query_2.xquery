for $id in distinct-values(doc("purchaseorders.xml")//partid)
let $item :=doc("purchaseorders.xml")//item[partid=$id]
order by $id
let $product:=doc("products.xml")//product[@pid=$id]
let $quantity :=sum($item/quantity)
return <totalcost partid="{$id}"> {($product//price)*($quantity)}</totalcost>