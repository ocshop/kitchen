<div class="box info" id="compare">
	<div class="box-heading"><?php echo $heading_title; ?></div>
	<div class="box-content">
		<?php $products=array_reverse($products);  foreach ($products as $product) { ?>
		<div class="compare-block compare-block_<?php echo $product['product_id']; ?> clearfix">
			<div class="image fleft"><?php if ($product['thumb']) { ?>
			<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
			<?php } ?></div>
			<div class="extra-wrap">
				<div class="name">
					<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
				</div>
				<div class="remove">
					<a alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" class="hide_compare" onclick="RemoveCompare(<?php echo $product['product_id']; ?>)" ><i class="icon-remove-sign" ></i></a>
				</div>
			</div>
		</div>
		<?php } ?>
		<div class="product-compare"><a class="button" href="<?php echo $compare; ?>"><span><?php echo $text_compare; ?></span></a></div>
	</div>
</div>

