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
  <?php if ($articles) { ?>
  <div class="product-filter">
	<div class="display"><b><?php echo $text_display; ?></b> <a id="list_a" onclick="display('list');"><i class="icon-list"></i></a> <b>/</b> <div id="grid_b"><i class="icon-th"></i></div></div>
	   <div class="sort"><?php echo $text_sort; ?>
	  <select onchange="location = this.value;">
		<?php foreach ($sorts as $sorts) { ?>
		<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
		<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
		<?php } else { ?>
		<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
		<?php } ?>
		<?php } ?>
	  </select>
	</div> <div class="limit"><?php echo $text_limit; ?>
	  <select onchange="location = this.value;">
		<?php foreach ($limits as $limits) { ?>
		<?php if ($limits['value'] == $limit) { ?>
		<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
		<?php } else { ?>
		<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
		<?php } ?>
		<?php } ?>
	  </select>
	</div>
  </div>

  <div class="product-grid">
	<ul class="row">
		<?php $i=0; foreach ($articles as $article) { $i++; ?>
		<?php 
			if ($i%3==1) {
				$a='first-in-line';
			}
			elseif ($i%3==0) {
				$a='last-in-line';
			}
			else {
				$a='';
			}
		?>
		<li class="span3 <?php echo $a?>">
		  <?php if ($article['thumb']) { ?>
		  <div class="image"><a href="<?php echo $article['href']; ?>"><img id="img_<?php echo $article['article_id']; ?>" src="<?php echo $article['thumb']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>
		  <?php } ?>
		  <div class="name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
		  <div class="description"><?php echo $article['description']; ?></div>
		  <div class="added-viewed"><i class=" icon-time"></i> <?php echo $article["date_added"];?>&nbsp;&nbsp;&nbsp;<i class=" icon-eye-open"></i> <?php echo $text_views; ?> <?php echo $article["viewed"];?></div>
		  <div class="rating">
		  <?php if ($article['rating']) { ?>
		  <img height="13" src="catalog/view/theme/kitchen/image/stars-<?php echo $article['rating']; ?>.png" alt="<?php echo $article['reviews']; ?>" />
		  <?php } ?>
		  </div>
		  <div class="more"><a class="button button-more" href="<?php echo $article['href']; ?>"><?php echo $button_more; ?></a></div>
		</li>
		<?php } ?>
	 </ul>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>

<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid ').attr('class', 'product-list');
		$('.product-list ul').removeClass('row');
		$('.product-list ul li').removeClass('span3');
		$('.product-list ul li').each(function(index, element) {
			html = '';
					html += '<div class="row">';
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image span2">' + image + '</div>';
			}
			html += '<div class="left span7">';
				html += '<div class="name">' + $(element).find('.name').html() + '</div>';
				html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			    html += '  <div class="added-viewed">' + $(element).find('.added-viewed').html() + '</div>';
				
				var rating = $(element).find('.rating').html();
				if (rating != null) {
					html += '<div class="rating">' + rating + '</div>';
				}
				html += '  <div class="more">' + $(element).find('.more').html() + '</div>';
				html += '</div>';
				html += '</div>';
			

						
			$(element).html(html);
		});	
		
		$('.display').html('<b><?php echo $text_display; ?></b> <div id="list_b"><i class="icon-list"></i></div> <a id="grid_a" onclick="display(\'grid\');"><i class="icon-th"></i></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		$('.product-grid ul').addClass('row');
		$('.product-grid ul li').addClass('span3');
		$('.product-grid ul li').each(function(index, element) {
			html = '';
					
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			html += '<div class="left">';
		
			
			
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			html += '  <div class="added-viewed">' + $(element).find('.added-viewed').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
			html += '  <div class="more">' + $(element).find('.more').html() + '</div>';
			html += '</div>';
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> <a id="list_a" onclick="display(\'list\');"><i class="icon-list"></i></a>  <div id="grid_b"><i class="icon-th"></i></div>');
		
		$.totalStorage('display', 'grid');
	}
	if ($('body').width() > 940) {
	// tooltip demo
		$('.tooltip-toggle').tooltip({
		selector: "a[data-toggle=tooltip]"
		})
		$('.tooltip-1').tooltip({
			placement:'bottom'
		})
		$('.tooltip-2').tooltip({
			placement:'top'
		})
		}
	
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('grid');
}
//--></script>  

<?php echo $footer; ?>