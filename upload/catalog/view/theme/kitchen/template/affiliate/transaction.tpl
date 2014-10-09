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
  <div class="box-container">
    <p><?php echo $text_balance; ?><b> <?php echo $balance; ?></b>.</p>
    <table class="list">
      <thead>
        <tr>
          <td class="left"><?php echo $column_date_added; ?></td>
          <td class="left"><?php echo $column_description; ?></td>
          <td class="right"><?php echo $column_amount; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php if ($transactions) { ?>
        <?php foreach ($transactions  as $transaction) { ?>
        <tr>
          <td class="left"><?php echo $transaction['date_added']; ?></td>
          <td class="left"><?php echo $transaction['description']; ?></td>
          <td class="right"><?php echo $transaction['amount']; ?></td>
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
          <td class="center" colspan="5"><?php echo $text_empty; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
    
    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
    </div>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php echo $content_bottom; ?></div>
        <?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>

<?php echo $footer; ?>