<div id="cart" >

  <div class="heading">
	<span class="link_a"> 
		<i class="icon-shopping-cart"></i>
		<b><?php echo $heading_title; ?></b>
		<span class="sc-button"></span>
		<span id="cart-total2"><?php echo $text_items2; ?></span>
		<span id="cart-total"><?php echo $text_items; ?></span>
		<i class="icon-caret-down"></i>
		<span class="clear"></span>
		</span>
	</div>
	
  <div class="content">
  <div class="content-scroll">
	
	<?php
	
	 if ($products || $vouchers) { 
	 
	 ?>
	 <span class="latest-added"><?php echo $text_latest_added;?></span>
	<br /><br />
	<div class="mini-cart-info">
	  <table class="cart">
		<?php $i=0; $products=array_reverse($products);  foreach ($products as $product) {
			$i++;
			if ($i>2) break;
		 ?>
		<tr>
		  <td class="image"><?php if ($product['thumb']) { ?>
			<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
			<?php } ?></td>
		  <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
			<div>
			  <?php foreach ($product['option'] as $option) { ?>
			  - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
			  <?php } ?>
			</div>
			  <span class="quantity">x&nbsp;<?php echo $product['quantity']; ?></span>
			  <span class="total"><?php echo $product['total']; ?></span>
			  <div class="remove"><span onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');"  ><i class="icon-remove-sign"></i><?php echo $button_remove; ?></span></div>
			  </td>
		  <!--td class="quantity">x&nbsp;<?php //echo $product['quantity']; ?></td-->
		  <!--td class="total"><?php //echo $product['total']; ?></td-->
		  
		</tr>
		<?php } ?>
		<?php foreach ($vouchers as $voucher) { ?>
		<tr>
		  <td class="image"></td>
		  <td class="name"><?php echo $voucher['description']; ?>
			<div class="remove"><span alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');"><i class="icon-remove-sign" ></i><?php echo $button_remove; ?></span></div>
			</td>
		  <!--<td class="quantity">x&nbsp;1</td>-->
		  <!--<td class="total"><?php echo $voucher['amount']; ?></td>-->
		  
		</tr>
		<?php } ?>
	  </table>
	</div>
	<div>
	  <table class="total">
		<?php foreach ($totals as $total) { ?>
		<tr>
		  <td align="right" class="total-right"><b><?php echo $total['title']; ?>:</b></td>
		  <td align="left" class="total-left"><span class="t-price"><?php echo $total['text']; ?></span></td>
		</tr>
		<?php } ?>
	  </table>
	</div>
	<div class="checkout">
			<a class="button" href="<?php echo $cart; ?>"><span><?php echo $text_cart; ?></span></a> 
			<a class="button" href="<?php echo $checkout; ?>"><span><?php echo $text_checkout; ?></span></a>
	</div>
	<?php } else { ?>
	<div class="empty"><?php echo $text_empty; ?></div>
	<?php } ?>
  </div>
  </div>
</div>
