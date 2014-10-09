<?php echo $header; ?>
<div class="<?php if ($column_right) { ?>span9<?php } else {?>span12<?php } ?>">
	<div class="row">

<div class="<?php if ($column_left or $column_right) { ?>span9<?php } ?> <?php if ($column_left and $column_right) { ?>span6<?php } ?> <?php if (!$column_right and !$column_left) { ?>span12 <?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($orders) { ?>
  <div class="box-container">
    <div class="count-item">
      <?php foreach ($orders as $order) { ?>
      <div class="order-list">
        <div class="heading-order-list">
          <div class="order-id"><b><?php echo $text_order_id; ?></b> <span>#<?php echo $order['order_id']; ?></span></div>
          <div class="order-status"><b><?php echo $text_status; ?></b> <span><?php echo $order['status']; ?></span></div>
        </div>
        <div class="order-content">
        <div class="row-fluid">
          <div class="span4"><b><?php echo $text_date_added; ?></b> <span><?php echo $order['date_added']; ?></span><br />
            <b><?php echo $text_products; ?></b> <strong><?php echo $order['products']; ?></strong></div>
          <div class="span4"><b><?php echo $text_customer; ?></b> <span><?php echo $order['name']; ?></span><br />
            <b><?php echo $text_total; ?></b> <span class="or-price"><?php echo $order['total']; ?></span></div>
          <div class="order-info span4"><a class="button" href="<?php echo $order['href']; ?>"><span><?php echo $button_view; ?></span></a>&nbsp;&nbsp;<a href="<?php echo $order['reorder']; ?>"><img src="catalog/view/theme/kitchen/image/reorder.png" alt="<?php echo $button_reorder; ?>" title="<?php echo $button_reorder; ?>" /></a></div>
        </div>
        </div>
      </div>
      <?php } ?>
    </div>
    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button-cont-right"><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a></div>
    </div>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="box-container">
    <div class="content"><?php echo $text_empty; ?></div>
    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button-cont-right"><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a></div>
    </div>
   </div>
    <?php } ?>
  
  <?php echo $content_bottom; ?></div>
    <?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>

<?php echo $footer; ?>