require "test_helper"

class MocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moc = mocs(:one)
  end

  test "should get index" do
    get mocs_url
    assert_response :success
  end

  test "should get new" do
    get new_moc_url
    assert_response :success
  end

  test "should create moc" do
    assert_difference("Moc.count") do
      post mocs_url, params: { moc: { add_actual_1: @moc.add_actual_1, add_actual_2: @moc.add_actual_2, add_actual_3: @moc.add_actual_3, add_actual_4: @moc.add_actual_4, add_actual_5: @moc.add_actual_5, add_actual_6: @moc.add_actual_6, add_target_1: @moc.add_target_1, add_target_2: @moc.add_target_2, add_target_3: @moc.add_target_3, add_target_4: @moc.add_target_4, add_target_5: @moc.add_target_5, add_target_6: @moc.add_target_6, cleanlinessTotal: @moc.cleanlinessTotal, cleanliness_score: @moc.cleanliness_score, coachSignature: @moc.coachSignature, di_guest_actual_1: @moc.di_guest_actual_1, di_guest_actual_2: @moc.di_guest_actual_2, di_guest_actual_3: @moc.di_guest_actual_3, di_guest_target_1: @moc.di_guest_target_1, di_guest_target_2: @moc.di_guest_target_2, di_guest_target_3: @moc.di_guest_target_3, di_time_actual_1: @moc.di_time_actual_1, di_time_actual_2: @moc.di_time_actual_2, di_time_actual_3: @moc.di_time_actual_3, di_time_target_1: @moc.di_time_target_1, di_time_target_2: @moc.di_time_target_2, di_time_target_3: @moc.di_time_target_3, dt_actual_1: @moc.dt_actual_1, dt_actual_2: @moc.dt_actual_2, dt_actual_3: @moc.dt_actual_3, dt_oepe_actual_1: @moc.dt_oepe_actual_1, dt_oepe_actual_2: @moc.dt_oepe_actual_2, dt_oepe_actual_3: @moc.dt_oepe_actual_3, dt_oepe_target_1: @moc.dt_oepe_target_1, dt_oepe_target_2: @moc.dt_oepe_target_2, dt_oepe_target_3: @moc.dt_oepe_target_3, dt_target_1: @moc.dt_target_1, dt_target_2: @moc.dt_target_2, dt_target_3: @moc.dt_target_3, duringShiftSuccess: @moc.duringShiftSuccess, moc_date: @moc.moc_date, moc_time: @moc.moc_time, morePracticeComments: @moc.morePracticeComments, opsTotal: @moc.opsTotal, ops_score: @moc.ops_score, organization_id: @moc.organization_id, postShiftSuccess: @moc.postShiftSuccess, preshiftSuccess: @moc.preshiftSuccess, q1: @moc.q1, q10: @moc.q10, q11: @moc.q11, q12: @moc.q12, q13: @moc.q13, q14: @moc.q14, q15: @moc.q15, q16: @moc.q16, q17: @moc.q17, q18: @moc.q18, q19: @moc.q19, q2: @moc.q2, q20: @moc.q20, q21: @moc.q21, q22: @moc.q22, q23: @moc.q23, q24: @moc.q24, q25: @moc.q25, q26: @moc.q26, q27: @moc.q27, q28: @moc.q28, q29: @moc.q29, q3: @moc.q3, q30: @moc.q30, q31: @moc.q31, q32: @moc.q32, q33: @moc.q33, q34: @moc.q34, q35: @moc.q35, q36: @moc.q36, q37: @moc.q37, q38: @moc.q38, q39: @moc.q39, q4: @moc.q4, q40: @moc.q40, q41: @moc.q41, q42: @moc.q42, q43: @moc.q43, q44: @moc.q44, q45: @moc.q45, q46: @moc.q46, q47: @moc.q47, q48: @moc.q48, q49: @moc.q49, q5: @moc.q5, q50: @moc.q50, q51: @moc.q51, q52: @moc.q52, q53: @moc.q53, q54: @moc.q54, q55: @moc.q55, q56: @moc.q56, q57: @moc.q57, q58: @moc.q58, q59: @moc.q59, q6: @moc.q6, q60: @moc.q60, q61: @moc.q61, q62: @moc.q62, q63: @moc.q63, q64: @moc.q64, q7: @moc.q7, q8: @moc.q8, q9: @moc.q9, qualityTotal: @moc.qualityTotal, quality_score: @moc.quality_score, serviceTotal: @moc.serviceTotal, service_score: @moc.service_score, slSignature: @moc.slSignature, store_id: @moc.store_id, verified: @moc.verified, veryGoodComments: @moc.veryGoodComments } }
    end

    assert_redirected_to moc_url(Moc.last)
  end

  test "should show moc" do
    get moc_url(@moc)
    assert_response :success
  end

  test "should get edit" do
    get edit_moc_url(@moc)
    assert_response :success
  end

  test "should update moc" do
    patch moc_url(@moc), params: { moc: { add_actual_1: @moc.add_actual_1, add_actual_2: @moc.add_actual_2, add_actual_3: @moc.add_actual_3, add_actual_4: @moc.add_actual_4, add_actual_5: @moc.add_actual_5, add_actual_6: @moc.add_actual_6, add_target_1: @moc.add_target_1, add_target_2: @moc.add_target_2, add_target_3: @moc.add_target_3, add_target_4: @moc.add_target_4, add_target_5: @moc.add_target_5, add_target_6: @moc.add_target_6, cleanlinessTotal: @moc.cleanlinessTotal, cleanliness_score: @moc.cleanliness_score, coachSignature: @moc.coachSignature, di_guest_actual_1: @moc.di_guest_actual_1, di_guest_actual_2: @moc.di_guest_actual_2, di_guest_actual_3: @moc.di_guest_actual_3, di_guest_target_1: @moc.di_guest_target_1, di_guest_target_2: @moc.di_guest_target_2, di_guest_target_3: @moc.di_guest_target_3, di_time_actual_1: @moc.di_time_actual_1, di_time_actual_2: @moc.di_time_actual_2, di_time_actual_3: @moc.di_time_actual_3, di_time_target_1: @moc.di_time_target_1, di_time_target_2: @moc.di_time_target_2, di_time_target_3: @moc.di_time_target_3, dt_actual_1: @moc.dt_actual_1, dt_actual_2: @moc.dt_actual_2, dt_actual_3: @moc.dt_actual_3, dt_oepe_actual_1: @moc.dt_oepe_actual_1, dt_oepe_actual_2: @moc.dt_oepe_actual_2, dt_oepe_actual_3: @moc.dt_oepe_actual_3, dt_oepe_target_1: @moc.dt_oepe_target_1, dt_oepe_target_2: @moc.dt_oepe_target_2, dt_oepe_target_3: @moc.dt_oepe_target_3, dt_target_1: @moc.dt_target_1, dt_target_2: @moc.dt_target_2, dt_target_3: @moc.dt_target_3, duringShiftSuccess: @moc.duringShiftSuccess, moc_date: @moc.moc_date, moc_time: @moc.moc_time, morePracticeComments: @moc.morePracticeComments, opsTotal: @moc.opsTotal, ops_score: @moc.ops_score, organization_id: @moc.organization_id, postShiftSuccess: @moc.postShiftSuccess, preshiftSuccess: @moc.preshiftSuccess, q1: @moc.q1, q10: @moc.q10, q11: @moc.q11, q12: @moc.q12, q13: @moc.q13, q14: @moc.q14, q15: @moc.q15, q16: @moc.q16, q17: @moc.q17, q18: @moc.q18, q19: @moc.q19, q2: @moc.q2, q20: @moc.q20, q21: @moc.q21, q22: @moc.q22, q23: @moc.q23, q24: @moc.q24, q25: @moc.q25, q26: @moc.q26, q27: @moc.q27, q28: @moc.q28, q29: @moc.q29, q3: @moc.q3, q30: @moc.q30, q31: @moc.q31, q32: @moc.q32, q33: @moc.q33, q34: @moc.q34, q35: @moc.q35, q36: @moc.q36, q37: @moc.q37, q38: @moc.q38, q39: @moc.q39, q4: @moc.q4, q40: @moc.q40, q41: @moc.q41, q42: @moc.q42, q43: @moc.q43, q44: @moc.q44, q45: @moc.q45, q46: @moc.q46, q47: @moc.q47, q48: @moc.q48, q49: @moc.q49, q5: @moc.q5, q50: @moc.q50, q51: @moc.q51, q52: @moc.q52, q53: @moc.q53, q54: @moc.q54, q55: @moc.q55, q56: @moc.q56, q57: @moc.q57, q58: @moc.q58, q59: @moc.q59, q6: @moc.q6, q60: @moc.q60, q61: @moc.q61, q62: @moc.q62, q63: @moc.q63, q64: @moc.q64, q7: @moc.q7, q8: @moc.q8, q9: @moc.q9, qualityTotal: @moc.qualityTotal, quality_score: @moc.quality_score, serviceTotal: @moc.serviceTotal, service_score: @moc.service_score, slSignature: @moc.slSignature, store_id: @moc.store_id, verified: @moc.verified, veryGoodComments: @moc.veryGoodComments } }
    assert_redirected_to moc_url(@moc)
  end

  test "should destroy moc" do
    assert_difference("Moc.count", -1) do
      delete moc_url(@moc)
    end

    assert_redirected_to mocs_url
  end
end
