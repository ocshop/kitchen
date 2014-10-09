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
      <p><?php echo $text_description; ?></p>
      <p><?php echo $text_code; ?><br />
        <textarea cols="40" rows="5"><?php echo $code; ?></textarea>
      </p>
      <p><?php echo $text_generator; ?><br />
        <input type="text" name="product" value="" />
      </p>
      <p><?php echo $text_link; ?><br />
        <textarea name="link" cols="40" rows="5"></textarea>
      </p>
      <div class="buttons">
        <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
      </div>
  </div>
  <?php echo $content_bottom; ?></div>
	<?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>

<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=affiliate/tracking/autocomplete&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.link
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'product\']').attr('value', ui.item.label);
		$('textarea[name=\'link\']').attr('value', ui.item.value);
						
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});
//--></script> 
<?php echo $footer; ?>