<script type="text/javascript">
	$(function(){
		$('.info-list li').last().addClass('last');
	});
</script>
<div class="box info">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
  	
    <ul class="info-list">
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
</div>
