<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/view/user/parts/header.jsp" %>


<!-- main-area -->
<main class="main-area fix">

  <!-- breadcrumb-area -->
  <section class="breadcrumb__area breadcrumb__bg"
           data-background="${pageContext.request.contextPath}/view/user/assets/img/bg/breadcrumb_bg.jpg">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="breadcrumb__content">
            <h3 class="title">${studyset.setName}</h3>
          </div>
        </div>
      </div>
    </div>
    <div class="breadcrumb__shape-wrap">
      <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape01.svg" alt="img"
           class="alltuchtopdown">
      <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape02.svg" alt="img"
           data-aos="fade-right" data-aos-delay="300">
      <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape03.svg" alt="img"
           data-aos="fade-up" data-aos-delay="400">
      <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape04.svg" alt="img"
           data-aos="fade-down-left" data-aos-delay="400">
      <img src="${pageContext.request.contextPath}/view/user/assets/img/others/breadcrumb_shape05.svg" alt="img"
           data-aos="fade-left" data-aos-delay="400">
    </div>
  </section>
  <!-- breadcrumb-area-end -->

  <!-- all-courses -->
  <section class="all-courses-area section-py-120">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 order-2 order-lg-0">
          <aside class="courses__sidebar">
            <div class="courses-widget">
              <h4 class="widget-title">Info (${terms ne null and not empty terms ? terms.size() : 0} terms)</h4>
              <div class="courses-cat-list">
                <h5 class="ms-3">${subject.subject_name}</h5>
                <i class="text-end">By ${author.fullname}</i>
              </div>
            </div>

          </aside>
        </div>

        <script>
          $(document).ready(function () {
            let timeoutId;

            $("#searchSubjectValue").on("input", function () {
              let searchValue = $(this).val().trim();
              clearTimeout(timeoutId);

              if (searchValue.length > 0) {
                timeoutId = setTimeout(function () {
                  $.ajax({
                    url: 'getSuggestions',
                    type: 'GET',
                    data: {searchValue: searchValue},
                    success: function (data) {
                      displaySuggestions(data);
                    },
                    error: function (xhr, status, error) {
                      console.error("Error: " + error);
                    }
                  });
                }, 300);
              } else {
                hideSuggestions();
              }
            });

            function displaySuggestions(data) {
              $("#suggestions-custom").empty();

              if (data.length > 0) {
                let ul = $('<ul class="suggestions-list"></ul>');

                data.forEach(function (item) {
                  let li = $('<li class="suggestion-item">' + item.subject_name + '</li>');
                  li.on('click', function () {
                    $('#searchSubjectValue').val(item.subject_name);
                    hideSuggestions();
                  });
                  ul.append(li);
                });

                $("#suggestions-custom").append(ul);
                showSuggestions();
              } else {
                hideSuggestions();
              }
            }

            function showSuggestions() {
              let inputOffset = $("#searchSubjectValue").offset();
              let inputHeight = $("#searchSubjectValue").outerHeight();

              $("#suggestions-popup-custom").css({
                top: inputOffset.top + inputHeight + "px",
                left: inputOffset.left + "px",
                marginTop: 5 + "px",
                width: 450 + "px",
                borderTop: 1 + "px " + "solid" + " #ccc",
                borderRadius: 10 + "px",
                display: 'block'
              });
              $(".suggestions-list").css({
                marginBottom: 0 + "px",
                padding: 0 + "px"
              });
            }

            function hideSuggestions() {
              $("#suggestions-popup-custom").hide();
            }

            $(document).on('click', function (e) {
              if (!$(e.target).closest('#suggestions-popup-custom').length && !$(e.target).is('#searchSubjectValue')) {
                hideSuggestions();
              }
            });
          });
        </script>

        <div class="col-xl-9 col-lg-8 bg-primary-light p-3 rounded d-flex justify-content-center align-items-center">
          <div class="container">
            <c:if test="${terms eq null or empty terms}">
              <h1 class="h2">No terms for this studyset?</h1>
            </c:if>
            <div class="accordion w-100" id="termList">
              <c:forEach var="term" items="${terms}" varStatus="status">
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#term_${status.index}" aria-expanded="false" aria-controls="term_${status.index}">
                      ${term.term}
                    </button>
                  </h2>
                  <div id="term_${status.index}" class="accordion-collapse collapse" data-bs-parent="#termList">
                    <div class="accordion-body">${term.definition}</div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
  </section>
  <!-- all-courses-end -->

</main>

<script>

  document.addEventListener("DOMContentLoaded", function () {
    // Get the select element
    const orderBySelect = document.getElementById('orderBy');

    // Add event listener to update URL when selection changes
    orderBySelect.addEventListener('change', function () {
      // Get the selected value
      const selectedValue = this.value;

      // Update the URL with selected value
      updateURL(selectedValue);
    });

    // Function to update URL with selected value
    function updateURL(selectedValue) {
      // Get the current URL
      let url = new URL(window.location.href);

      // Update or add the "orderBy" parameter with selected value
      url.searchParams.set('orderBy', selectedValue);

      // Redirect to the updated URL
      window.location.href = url.toString();
    }

    // Function to pre-select the option based on the URL parameter
    function preSelectOption() {
      // Get the current URL
      let url = new URL(window.location.href);

      // Get the value of the "orderBy" parameter from the URL
      const orderByParam = url.searchParams.get('orderBy');

      // If orderByParam exists and matches one of the options, select it
      if (orderByParam && document.querySelector(`option[value="${requestScope.orderByParam}"]`)) {
        orderBySelect.value = orderByParam;
      }
    }

    // Call preSelectOption function to pre-select the option when the page loads
    preSelectOption();

    const collapseElementList = document.querySelectorAll('.collapse')
    const collapseList = [...collapseElementList].map(collapseEl => new bootstrap.Collapse(collapseEl))
  });

</script>



<%@include file="/view/user/parts/footer.jsp" %>
