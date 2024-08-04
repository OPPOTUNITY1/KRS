<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/view/dashboard/parts/header.jsp" %>
<%@include file="/view/dashboard/parts/sidebar.jsp" %>

<div class="main-wrapper">


  <!-- Page Wrapper -->
  <div class="page-wrapper">
    <div class="content container-fluid">
      <!-- Page Header -->
      <div class="page-header">
        <div class="row align-items-center">
          <div class="col">
            <h3 class="page-title">Studyset</h3>
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="subjects">Setting</a></li>
              <li class="breadcrumb-item active">Studyset</li>
            </ul>
          </div>
        </div>
      </div>
      <!-- /Page Header -->

      <div class="row">
        <div class="col-sm-12">
          <div class="card">
            <div class="card-body">
              <div class="container mb-5 justify-content-center">
                <form action="${studyset ne null ? 'update' : 'insert'}" method="POST">
                  <div class="col container">
                    <div class="col-12">
                      <h5 class="form-title"><span>Studyset Form  </span></h5><br>
                    </div>
                    <div class="col-12 col-sm-8">
                      <div class="input-block local-forms">
                        <c:if test="${studyset ne null}">
                          <input type="hidden" name="studysetId" hidden="" value="${studyset.setId}">
                        </c:if>
                        <input type="text" name="name" class="form-control" required="" placeholder="Studyset Name" value="${studyset.setName}">
                      </div>
                    </div>
                    <div class="col-12 col-sm-8">
                      <div class="input-block local-forms">
                        <select name="subject_id" class="form-select" required="">
                          <option disabled>Subject</option>
                          <c:forEach var="sbj" items="${subjects}">
                            <option value="${sbj.subject_id}" ${studyset.subjectId eq sbj.subject_id ? 'selected' : null}>${sbj.subject_name}</option>
                          </c:forEach>
                        </select>
                      </div>
                    </div>
                    <div class="col col-12">
                      <h5>Term and Definitions</h5>
                      <div id="term-definitions-container">

                        <c:choose>
                          <c:when test="${terms eq null}">
                            <div class="row term-definition-pair mt-2">
                              <input type="hidden" name="termid_0" hidden="" value="0">
                              <div class="col-12 col-sm-5">
                                <div class="form-floating">
                                  <textarea class="form-control" placeholder="Term" name="term_0" rows="1"></textarea>
                                  <label>Term</label>
                                </div>
                              </div>
                              <div class="col-12 col-sm-6">
                                <div class="form-floating">
                                  <textarea class="form-control" placeholder="Definition" name="definition_0" rows="1"></textarea>
                                  <label>Definition</label>
                                </div>
                              </div>
                              <button type="button" class="btn btn-danger col-1 remove-pair"><i class="fa fa-x"></i></button>
                            </div>
                          </c:when>
                          <c:otherwise>
                            <c:forEach var="term" items="${terms}" varStatus="status">
                              <div class="row term-definition-pair mt-2">
                                <input type="hidden" name="termid_${status.index}" hidden="" value="${term.id}">
                                <div class="col-12 col-sm-5">
                                  <div class="form-floating">
                                    <textarea class="form-control" placeholder="Term" name="term_${status.index}" rows="1">${term.term}</textarea>
                                    <label>Term</label>
                                  </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                  <div class="form-floating">
                                    <textarea class="form-control" placeholder="Definition" name="definition_${status.index}" rows="1">${term.definition}</textarea>
                                    <label>Definition</label>
                                  </div>
                                </div>
                                <button type="button" class="btn btn-danger col-1 remove-pair"><i class="fa fa-x"></i></button>
                              </div>
                            </c:forEach>
                          </c:otherwise>
                        </c:choose>

                      </div>
                      <button type="button" id="add-pair" class="btn btn-success col-3 mt-2 mb-5">Add Term-Definition</button>
                    </div>
                    <div class="col-12">
                      <button type="submit" class="btn btn-primary"> Save changes </button>
                    </div>
                  </div>
                </form>
              </div>
              <!--              <script>
                              $(document).ready(function () {
                              let pairCount = ${terms ne null ? terms.size() : '1'};
                              $('#add-pair').click(function () {
                              let newPair = `
                                  <div class="row term-definition-pair mt-2">
                                    <input type="hidden" name="termid_\${pairCount}" hidden="" value="0">
                                    <div class="col-12 col-sm-5">
                                      <div class="form-floating">
                                        <textarea class="form-control" placeholder="Term" name="term_\${pairCount}" rows="1"></textarea>
                                        <label>Term</label>
                                      </div>
                                    </div>
                                    <div class="col-12 col-sm-6">
                                      <div class="form-floating">
                                        <textarea class="form-control" placeholder="Definition" name="definition_\${pairCount}" rows="1"></textarea>
                                        <label>Definition</label>
                                      </div>
                                    </div><button type="button" class="btn btn-danger col-1 remove-pair"><i class="fa fa-x"></i></button>
                                  </div>`;
                              $('#term-definitions-container').append(newPair);
                              pairCount++;
                              });
                              });
                              $('#term-definitions-container').on('click', '.remove-pair', function () {
                              $(this).closest('.term-definition-pair').remove();
                              });
                            </script>-->
              <script>
                $(document).ready(function () {
                  let pairCount = ${terms ne null ? terms.size() : '1'};

                  function updateIndices() {
                    $('#term-definitions-container .term-definition-pair').each(function (index) {
                      $(this).find('input[name^="termid_"]').attr('name', 'termid_' + index);
                      $(this).find('textarea[name^="term_"]').attr('name', 'term_' + index);
                      $(this).find('textarea[name^="definition_"]').attr('name', 'definition_' + index);
                    });
                  }

                  $('#add-pair').click(function () {
                    let newPair = `
                      <div class="row term-definition-pair mt-2">
                        <input type="hidden" name="termid_${pairCount}" hidden="" value="0">
                        <div class="col-12 col-sm-5">
                          <div class="form-floating">
                            <textarea class="form-control" placeholder="Term" name="term_${pairCount}" rows="1"></textarea>
                            <label>Term</label>
                          </div>
                        </div>
                        <div class="col-12 col-sm-6">
                          <div class="form-floating">
                            <textarea class="form-control" placeholder="Definition" name="definition_${pairCount}" rows="1"></textarea>
                            <label>Definition</label>
                          </div>
                        </div>
                        <button type="button" class="btn btn-danger col-1 remove-pair"><i class="fa fa-x"></i></button>
                      </div>`;
                    $('#term-definitions-container').append(newPair);
                    pairCount++;
                    updateIndices();
                  });

                  $('#term-definitions-container').on('click', '.remove-pair', function () {
                    $(this).closest('.term-definition-pair').remove();
                    pairCount--;
                    updateIndices();
                  });
                });
              </script>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<%@include file="/view/dashboard/parts/footer.jsp" %>
