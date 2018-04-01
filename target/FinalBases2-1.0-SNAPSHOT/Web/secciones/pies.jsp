<%-- 
    Document   : pies
    Created on : Mar 31, 2018, 10:56:17 AM
    Author     : jsbon
--%>



<script type="application/javascript">
  $( document ).ready(function() {
    $.CestaFeira({
      debug: false,
      onItemAdded: function (item) {
        console.log(item);
      },
      onItemUpdated: function (item) {
        console.log(item);
      }
    });
  });
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>



<footer class="foot py-2 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Bases de datos II - <a href="http://www.udistrital.edu.co">Universidad Distrital Francisco José de Caldas</a> - 2018</p>
    </div>
    <!-- /.container -->
</footer>
</body>
</html>