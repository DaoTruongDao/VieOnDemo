//
//  APIPortal.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 01/12/2021.
//


import UIKit
import Alamofire
import ObjectMapper

// MARK: - Headers
extension APIPortal {
    
}
class APIPortal: NSObject {
    static let shared = APIPortal()
    func product( complete: ((VotingModel) -> Void)?, failure: (() -> Void)? ) {
        if let url = URL.init(string: "https://testing-game-api.vieon.vn/voting/1/option_chart?platform=ios&ui=012021") {
            _ = self.requestApiWith(url: url,
                                    menthodApi: .get,
                                    parameters: nil,
                                    encoding: URLEncoding.default,
                                    header: ["content-type": "application/json", "Accept-Language": TimeZone.current.identifier ,"Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MzMxMDE0NTksImp0aSI6ImIxZTkzZGY5YzU5MmU2Mjc1YjQwNGRhMTE3ZjRkMTZiIiwiYXVkIjoiIiwiaWF0IjoxNjMwNTA5NDU5LCJpc3MiOiJWaWVPbiIsIm5iZiI6MTYzMDUwOTQ1OCwic3ViIjoiYW5vbnltb3VzXzFDODNCRDQ0LUQ4RjYtNDM1QS1CQjZDLUNBNzlGREU3MDFGNi1kNTMxZDRkMjYzMmVmOTgyM2U0ZTI1MjBmOGU0NGY5NC0xNjMwNTA5NDU5Iiwic2NvcGUiOiJjbTpyZWFkIGNhczpyZWFkIGNhczp3cml0ZSBiaWxsaW5nOnJlYWQiLCJkaSI6IjFDODNCRDQ0LUQ4RjYtNDM1QS1CQjZDLUNBNzlGREU3MDFGNi1kNTMxZDRkMjYzMmVmOTgyM2U0ZTI1MjBmOGU0NGY5NC0xNjMwNTA5NDU5IiwidWEiOiJWaWVPTiUyMFN0YWdpbmcvMjEwNjI0MDAgQ0ZOZXR3b3JrLzk3OC4wLjcgRGFyd2luLzE4LjcuMCIsImR0IjoiaW9zIiwibXRoIjoiYW5vbnltb3VzX2xvZ2luIiwibWQiOiJpUGhvbmUgOCIsImlzcHJlIjowLCJ2ZXJzaW9uIjoiIn0.bo8Uhy0QTpq5iWMT7DUXA63GNuIrL9NljihC5oBxU3Y"],
                                    complete: {(json) in
                                        let model = VotingModel.init(JSONString: json)
                                        
            }, fail: {
                print("fail")
            })
        }
    }
}


extension APIPortal{
    struct RequestBodyFormDataKeyValue {
        var sKey: String
        var sValue: String
    }
        
    func login(phone: String, pass: String, complete: ((LoginModel) -> Void)?, failure: ((ResponseObjects) -> Void)? ) {
        var bodyKeyValue = [RequestBodyFormDataKeyValue]()
        bodyKeyValue.append(RequestBodyFormDataKeyValue(sKey: "phone_number", sValue: phone))
        bodyKeyValue.append(RequestBodyFormDataKeyValue(sKey: "password", sValue: pass))
        
        var sURL : String!
        sURL = "https://testing-api.vieon.vn/backend/user/login/mobile"
        let serializer = DataResponseSerializer(emptyRequestMethods: Set(minimumCapacity: 200))
        
        var sampleRequest = URLRequest(url: URL(string: sURL)!)
        sampleRequest.httpMethod = HTTPMethod.post.rawValue
        
        AF.upload(multipartFormData: { multipartFormData in
            for  formData in bodyKeyValue
            {
                multipartFormData.append(Data(formData.sValue.utf8), withName:  formData.sKey)
            }
            
        }, to: sURL,method: .post)
        .uploadProgress{progress in
            print(CGFloat(progress.fractionCompleted))
        }
        .response{response in
            if(response.error == nil){
                var reponseString : String!
                reponseString = ""
                if response.data != nil  {
                    reponseString = String(bytes: response.data!, encoding: .utf8)
                }
                else{
                    reponseString = response.response?.description
                }
                
                print(reponseString ?? "")
                print(response.response?.statusCode)
                
                var reponseData : NSData!
                reponseData = response.data! as NSData
                var iDataLength = reponseData.length
                print("Size :\(iDataLength) bytes")
//                print("reponse Time:\(reponse.metrics?)")
            }
        }
    }
}


extension APIPortal{
 func list(complete: ((ListModel) -> Void)?, failure: (() -> Void)? ) {

    let param = ["limit": 10, "page": 0, "platform": "ios", "ui": 012021] as [String: Any]
    if let url = URL.init(string: "https://testing-api.vieon.vn/backend/cm/v5/ribbon/d0ce2475-5ffe-4892-b0d1-15e0fe0fdbef?limit=10&page=0&platform=ios&ui=012021") {
        _ = self.requestApiWith(url: url,
                                menthodApi: .get,
                                parameters: param,
                                encoding: URLEncoding.default,
                                header: ["content-type": "application/json", "Accept-Language": TimeZone.current.identifier ,"Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MzMxMDE0NTksImp0aSI6ImIxZTkzZGY5YzU5MmU2Mjc1YjQwNGRhMTE3ZjRkMTZiIiwiYXVkIjoiIiwiaWF0IjoxNjMwNTA5NDU5LCJpc3MiOiJWaWVPbiIsIm5iZiI6MTYzMDUwOTQ1OCwic3ViIjoiYW5vbnltb3VzXzFDODNCRDQ0LUQ4RjYtNDM1QS1CQjZDLUNBNzlGREU3MDFGNi1kNTMxZDRkMjYzMmVmOTgyM2U0ZTI1MjBmOGU0NGY5NC0xNjMwNTA5NDU5Iiwic2NvcGUiOiJjbTpyZWFkIGNhczpyZWFkIGNhczp3cml0ZSBiaWxsaW5nOnJlYWQiLCJkaSI6IjFDODNCRDQ0LUQ4RjYtNDM1QS1CQjZDLUNBNzlGREU3MDFGNi1kNTMxZDRkMjYzMmVmOTgyM2U0ZTI1MjBmOGU0NGY5NC0xNjMwNTA5NDU5IiwidWEiOiJWaWVPTiUyMFN0YWdpbmcvMjEwNjI0MDAgQ0ZOZXR3b3JrLzk3OC4wLjcgRGFyd2luLzE4LjcuMCIsImR0IjoiaW9zIiwibXRoIjoiYW5vbnltb3VzX2xvZ2luIiwibWQiOiJpUGhvbmUgOCIsImlzcHJlIjowLCJ2ZXJzaW9uIjoiIn0.bo8Uhy0QTpq5iWMT7DUXA63GNuIrL9NljihC5oBxU3Y"],
                                complete: {(json) in
                             
                                    
                                    if let model = ListModel.init(JSONString: json){
                                        complete?(model)
                                        
                                    }
        }, fail: {
            print("fail")
        })
    }
}


// MARK: - API Login - logout
//extension APIPortal {
//
//
//}
//    func refeshToken( complete: ((LoginResponse) -> Void)?, failure: ((String) -> Void)? ) {
//        if let user = LocalDataManager.shared.getData(key: KeyStore.user.rawValue) as? EmployeeModel, let access_token = user.access_token, let refresh_token = user.refresh_token, !access_token.isEmpty && !refresh_token.isEmpty {
//           let params = ["access_token": access_token, "refresh_token": refresh_token ] as [String: Any]
//           _ = self.requestApiWith(url: URL.urlRefeshToken, menthodApi: .post, parameters: params, encoding: JSONEncoding.default, header: nil,
//                                   complete: { (json) in
//                                       if let response = LoginResponse.init(json: json.convertToDictionary()) {
//                                           if response.isSuccess() {
//                                               complete?(response)
//                                           } else {
//                                               failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                           }
//                                       } else {
//                                           failure?(R.string.localizable.server_error().localized())
//                                       }},
//                                   fail: { _ in  }
//           )
//        }
//       }
//    func logout(token: String, complete: ((ResponseObjects) -> Void)?, failure: ((String) -> Void)? ) {
//        let params = [ "token": token ] as [String: Any]
//        _ = self.requestApiWith(url: URL.urlLogout, menthodApi: .post, parameters: params, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = ResponseObjects.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in }
//        )
//    }
//}
//

// MARK: - API Equipment List
//extension APIPortal {
//    func getLogin(complete: ((LoginModel) -> Void)?) {
//        _ = self.requestApiWith(url: URL.urlEquipmentList, menthodApi: .get, encoding: JSONEncoding.default, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = EquipmentListResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        }
//                                    }},
//                                fail: { _ in})
//    }

//     func getEquipListFilter(areaId: Int?, typeId: Int?, pageIndex: Int, pageSize: Int, complete: ((EquipmentListResponse) -> Void)?, failure: ((String) -> Void)? ) {
//
//        var params = [
//            "pageIndex": pageIndex,
//            "pageSize": pageSize,
//            "descending": true] as [String: Any]
//        if let _areaid = areaId { params["areaid"] = _areaid }
//        if let _typeid = typeId { params["typeid"] = _typeid }
//        if let date = BookData.shared.bookModel?.delivery_date, let startDate = Date.dateToStringGlobalTime(date: Calendar.current.startOfDay(for: date), typeFormat: .dateTime) {
//            params["deliverydate"] = startDate
//        }
//        if let date = BookData.shared.bookModel?.return_date, let returndate = Date.dateToStringGlobalTime(date: Calendar.current.endOfDay(for: date), typeFormat: .dateTime) {
//            params["returndate"] = returndate
//        }
//
//        _ = self.requestApiWith(url: URL.urlEquipmentListFilter, menthodApi: .get, parameters: params, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = EquipmentListResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in }
//        )
//    }
//
//    func getEquipment(id: Int, complete: ((EquipmentResponse) -> Void)?, failure: ((String) -> Void)? ) {
//        let params = [ "id": id ] as [String: Any]
//        _ = self.requestApiWith(url: URL.urlEquipment(id: id), menthodApi: .get, parameters: params, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = EquipmentResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.lizable.server_error().localized())
//                                    }},
//                                fail: { _ in }
//        )
//    }
//
//    func getEquipmentForSchedule(areaId: Int?, typeId: Int?, pageIndex: Int, pageSize: Int, complete: ((EquipmentForScheduleResponse) -> Void)?, failure: ((String) -> Void)? ) {
//        if let startDate = Date.dateToString(date: Date(), typeFormat: .date),  let endDate = Date.dateToString(date: Date()?.dateOfValue(value: 365), typeFormat: .date) {
//            var params = [
//                "pageIndex": pageIndex,
//                "pageSize": pageSize,
//                "endDate": endDate,
//                "startDate": startDate] as [String: Any]
//            if let _areaid = areaId { params["areaid"] = _areaid }
//            if let _typeid = typeId { params["typeid"] = _typeid }
//            _ = self.requestApiWith(url: URL.urlEquipmentforSchedule, menthodApi: .get, parameters: params, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                                 complete: { (json) in
//                                                     if let response = EquipmentForScheduleResponse.init(json: json.convertToDictionary()) {
//                                                         if response.isSuccess() {
//                                                             complete?(response)
//                                                         } else {
//                                                             failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                                         }
//                                                     } else {
//                                                         failure?(R.string.localizable.server_error().localized())
//                                                     }},
//                                                 fail: { _ in }
//                         )
//        }
//    }
//}

// MARK: - API Customer
//extension APIPortal {
//    func getHospitalList(name: String?, showAll: Bool?, soldtoCode: String?, pageIndex: Int, pageSize: Int, complete: ((CustomersResponse) -> Void)?, failure: ((String) -> Void)?) {
//        var params: [String: Any] = [:]
//        params["pageIndex"] = pageIndex
//        params["pageSize"] = pageSize
//        if let _name = name {
//            params["name"] = _name
//        }
//
//        if let _soldtoCode = soldtoCode {
//            params["soldto-code"] = _soldtoCode
//        }
//
////        if showAll ?? false {
////            params["showAll"] = true
////        } else {
////            params["showAll"] = false
////        }
//        params["hospitalAll"] =  BookData.shared.bookModel?.isShowAllHospital
//
//        params["soldToAll"] = BookData.shared.bookModel?.isShowAllSoldTo
//        _ = self.requestApiWith(url: URL.urlHospital, menthodApi: .get, parameters: params, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = CustomersResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in }
//        )
//    }
//
//    func getShipToList(name: String, pageIndex: Int, pageSize: Int, complete: ((CustomersResponse) -> Void)?, failure: ((String) -> Void)?) {
//        var params = [
//            "pageIndex": pageIndex,
//            "pageSize": pageSize,
//            "name": name] as [String: Any]
//        if BookData.shared.bookModel?.isMutipleBooking ?? false  {
//            params["big_equipment"] = true
//        } else {
//            if  BookData.shared.bookModel?.equipments.first?.small_equipment ?? false {
//                params["big_equipment"] = false
//            } else {
//                 params["big_equipment"] = true
//            }
//
//        }
//
//
//        params["shipping_condition"] = BookData.shared.bookModel?.shippingCondition
//
//        _ = self.requestApiWith(url: URL.urlShipTo, menthodApi: .get, parameters: params, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = CustomersResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in }
//        )
//    }
//
//    func getSoldToList(name: String?, showAll: Bool?, pageIndex: Int, pageSize: Int, complete: ((CustomersResponse) -> Void)?, failure: ((String) -> Void)? ) {
//        var params: [String: Any] = [:]
//        params["showAll"] = showAll ?? false
//        if let _name = name {
//            params["name"] = _name
//        }
//        params["pageIndex"] = pageIndex
//        params["pageSize"] = pageSize
//
//
//
//        _ = self.requestApiWith(url: URL.urlSoldTo, menthodApi: .get, parameters: params, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = CustomersResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in }
//        )
//    }
//
//    func getOrderReasonList(complete: ((OrderReasonsResponse) -> Void)?, failure: ((String) -> Void)? ) {
//        _ = self.requestApiWith(url: URL.urlOrderReasonList, menthodApi: .get, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = OrderReasonsResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in }
//        )
//    }
//}
//
//// MARK: - API Booking
//extension APIPortal {
//
//    func getBookingsByEmId(employeeId: Int, pageIndex: Int, pageSize: Int, complete: ((BookingListResponse) -> Void)?, failure: ((String) -> Void)? ) {
//        let params = ["pageIndex": pageIndex,
//                      "pageSize": pageSize,
//                      "employeeid": employeeId
//            ] as [String: Any]
//        _ = self.requestApiWith(url: URL.urlBookingListByEmid, menthodApi: .get, parameters: params, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = BookingListResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in }
//        )
//    }
//
//    func getBookingsByAreaIdTypeId(employeeid: Int, area_id: Int?, type_id: Int?, pageIndex: Int, pageSize: Int, complete: ((BookingListResponse) -> Void)?, failure: ((String) -> Void)?) {
//        var params = [
//            "pageIndex": pageIndex,
//            "pageSize": pageSize,
//            "descending": true] as [String: Any]
//        if let areaid = area_id { params["areaid"] = areaid }
//        if let typeid = type_id { params["typeid"] = typeid }
//
//        if !EmployeeModel.isAdmin {
//             params["employeeid"] = employeeid
//        }
//
//        _ = self.requestApiWith(url: URL.urlBookingListByAreaidTypeid, menthodApi: .get, parameters: params, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = BookingListResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in }
//        )
//    }
//
//    func getBookingById(bookingId: Int, complete: ((BookingResponse) -> Void)?, failure: ((String) -> Void)?) {
//        let params = [ "bookingid": bookingId ] as [String: Any]
//        _ = self.requestApiWith(url: URL.urlBookingDetail, menthodApi: .get, parameters: params, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = BookingResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in }
//        )
//    }
//
//    func paramsCreaterBooking(_bookingModel: BookingModel) -> [String: Any] {
//
//        var params: [String: Any] = [:]
//        // more params
//        params["lang"] =  UserDefaults.languageCode ?? "en"
//
//        // employee params
//        if let employee_id = EmployeeModel.current?.employee?.id { params["employee_id"] = employee_id }
//
//        // Equipment params groups
////        if let area_id = _bookingModel.equipment?.area_id { params["area_id"] = area_id }
////        if let type_id = _bookingModel.equipment?.type_id { params["type_id"] = type_id }
//        if let booking_id = _bookingModel.booking_id { params["booking_id"] = booking_id }
//        /// get list selected equipment
//        var result: [Int] = []
//        for equip in _bookingModel.equipments {
//            if let id = equip.equipment_id {
//                result.append(id)
//            }
//        }
//
//        if result.count > 0 {
//            params["equipment_ids"] = result
//        }
//         if let same_carry_in_person = _bookingModel.same_carry_in_person { params["same_carry_in_person"] = same_carry_in_person }
//
//        // Date/Time params groups
//         if let delivery_date = Date.dateToStringGlobalTime(date: _bookingModel.delivery_date, typeFormat: .dateTime) { params["delivery_date"] = delivery_date }
//        if let return_date = Date.dateToStringGlobalTime(date: _bookingModel.return_date, typeFormat: .dateTime) { params["return_date"] = return_date }
//        /// only apply time for smal equipment
//        params["expected_time"] = _bookingModel.expected_time.rawValue
//        // Infor contact booking
//        if let carryPerson =  _bookingModel.carryPerson { params["carry_in_person"] = carryPerson }
//        if let deliveryPerson =  _bookingModel.deliveryPerson { params["delivery_person"] = deliveryPerson }
//        if let deliveryPersonContact =  _bookingModel.deliveryPersonContact { params["delivery_person_contact"] = deliveryPersonContact }
//        if let recipientContact =  _bookingModel.recipientContact { params["reception_contact"] = recipientContact }
//        if let booking_remark = _bookingModel.booking_remark { params["comment"] = booking_remark } else {
//            params["comment"] = ""
//        }
//        // infor place booking
//        if let medical =  _bookingModel.medical { params["clinical_department"] = medical }
//        if let booking_reason =  _bookingModel.booking_reason?.id { params["booking_reason_id"] = booking_reason }
//
//        if let ship_to = _bookingModel.shipTo?.customerName { params["ship_to"] = ship_to }
//        if let  other_ship_to = _bookingModel.other_ship_to { params["other_ship_to"] = other_ship_to }
//
//        if let sold_to = _bookingModel.soldto?.customerName { params["sold_to"] = sold_to }
//        if let sold_to_id = _bookingModel.soldto?.id { params["sold_to_id"] = sold_to_id }
//        if let sold_to_is_shipto = _bookingModel.sold_to_is_shipto { params["sold_to_is_shipto"] = sold_to_is_shipto }
//        if let other_sold_to = _bookingModel.other_sold_to { params["other_sold_to"] = other_sold_to }
//
//        if let hospitalID = _bookingModel.hospital?.id { params["customer_id"] = hospitalID }
//        if let hospitalName = _bookingModel.hospital?.customerName { params["customer_name"] = hospitalName }
//        if let hospital_is_shipto = _bookingModel.hospital_is_shipto { params["hospital_is_shipto"] = hospital_is_shipto }
//        if let other_hospital = _bookingModel.other_hospital { params["other_hospital"] = other_hospital }
//
//       if let shippingCondition = _bookingModel.shippingCondition {
//                  params["shipping_condition"] = shippingCondition
//              }
//              if let booking_status_id = _bookingModel.status_response?.booking_status_id, let status_name = _bookingModel.status_response?.status_name {
//                  params["booking_status_request"] = [
//                      "status_id": booking_status_id,
//                      "status_name": status_name.rawValue
//                  ]
//              }
//        if let moreInforEquipment = BookData.shared.bookModel?.equipment_more_info_add {
//            params["equipment_more_info_add"] = moreInforEquipment
//
//        }
//
//        if let multi_booking = BookData.shared.bookModel?.isMutipleBooking {
//            params["multi_booking"] = multi_booking
//        }
//        if let moreInforEquipment = BookData.shared.bookModel?.equipment_more_info_delete {
//            params["equipment_more_info_delete"] = moreInforEquipment
//        }
//        if let reception = BookData.shared.bookModel?.reception {
//            params["reception"] = reception
//        }
//
//        if let all_hospital = BookData.shared.bookModel?.isShowAllHospital {
//            params["all_hospital"] = all_hospital
//        }
//
//        if let all_sold_to = BookData.shared.bookModel?.isShowAllSoldTo {
//             params["all_sold_to"] = all_sold_to
//        }
//
//        if let is_small_temple = BookData.shared.bookModel?.is_small_template {
//            params["small_template"] = is_small_temple
//        } else {
//              params["small_template"] = false
//        }
//
//        if let same_reception_contact = BookData.shared.bookModel?.same_reception_contact {
//             params["same_reception_contact"] = same_reception_contact
//        } else {
//             params["same_reception_contact"] = false
//        }
//        return params
//    }
//
//    func createrBooking(_bookingModel: BookingModel, menthodApi: HTTPMethod, complete: ((ResponseObjects) -> Void)?, failure: ((String) -> Void)?) {
//        _ = self.requestApiWith(url: URL.urlBooking, menthodApi: .post, parameters: paramsCreaterBooking(_bookingModel: _bookingModel), encoding: JSONEncoding.default, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = ResponseObjects.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in }
//        )
//    }
//
//    func updateBooking(_bookingModel: BookingModel, menthodApi: HTTPMethod, complete: ((UpdatedResponse) -> Void)?, failure: ((String) -> Void)?) {
//
//        _ = self.requestApiWith(url: URL.urlBookingUpdate, menthodApi: .put, parameters: paramsCreaterBooking(_bookingModel: _bookingModel), encoding: JSONEncoding.default, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = UpdatedResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: {  _ in }
//        )
//    }
//
//    func getListTheDatesHasbooked(_parameters: [String: Any], complete: ((TheDatesHasBookedResponse) -> Void)?, failure: ((String) -> Void)?) {
//
//        _ = self.requestApiWith(url: URL.urlTheDatesHasBooked, menthodApi: .post, parameters: _parameters, encoding: JSONEncoding.default, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = TheDatesHasBookedResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in  }
//        )
//    }
//
//    func getMultiEquipment(bookingId: Int,
//                     equipmentIdList: [Int],
//                     history: Bool,
//                     complete: ((MultiEquipmentResponse) -> Void)?,
//                     failure: ((String) -> Void)?) {
//        let params = ["equipment_ids": equipmentIdList, "booking_id" : bookingId, "history" : history] as [String: Any]
//
//        _ = self.requestApiWith(url: URL.urlMoreInfoMultiEquipment,
//                                menthodApi: .post,
//                                parameters: params,
//                                encoding: JSONEncoding.default,
//                                header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = MultiEquipmentResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in  }
//        )
//    }
//
//    func getBookingInScheduleById(bookingId: Int, complete: ((BookingResponse) -> Void)?, failure: ((String) -> Void)?) {
//           let params = [ "bookingid": bookingId ] as [String: Any]
//           _ = self.requestApiWith(url: URL.urlBookingDetailInSchedule, menthodApi: .get, parameters: params, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                   complete: { (json) in
//                                       if let response = BookingResponse.init(json: json.convertToDictionary()) {
//                                           if response.isSuccess() {
//                                               complete?(response)
//                                           } else {
//                                               failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                           }
//                                       } else {
//                                           failure?(R.string.localizable.server_error().localized())
//                                       }},
//                                   fail: { _ in }
//           )
//       }
//}
//

//// MARK: - API Search
//extension APIPortal {
//    func searchEquipment(areaId: Int?, typeId: Int?, deliveryDate: String, returnDate: String,pageSize: Int, pageIndex: Int, complete: ((SearchEquipmentResponse) -> Void)?, failure: ((String) -> Void)?) {
//        var params = [
//            "deliverydate": deliveryDate,
//            "returndate": returnDate,
//            "pageIndex": pageIndex,
//            "pageSize": pageSize
//            ] as [String: Any]
//
//        if let _areaid = areaId { params["areaid"] = _areaid }
//        if let _typeid = typeId { params["typeid"] = _typeid }
//
//        _ = self.requestApiWith(url: URL.urlSearchEquipment, menthodApi: .get, parameters: params, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = SearchEquipmentResponse.init(json: json.convertToDictionary()) {
//                                        if response.isSuccess() {
//                                            complete?(response)
//                                        } else {
//                                            failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                        }
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in }
//        )
//    }
//}
//
//// MARK: - API Update Status
//extension APIPortal {
//    func updateStatus(bookingModel: BookingModel, newStatus : Status?, menthodApi: HTTPMethod, complete: ((UpdatedResponse) -> Void)?, failure: ((String) -> Void)?) {
//
//        let params = [
//            "status_id": bookingModel.status_response?.booking_status_id ?? -1,
//            "status_name": newStatus?.rawValue ?? "",
//            "comment": bookingModel.comment ?? "",
//            "lang" : UserDefaults.languageCode ?? "en"
//            ] as [String: Any]
//
//        _ = self.requestApiWith(url: URL.urlUpdateBookingStatus(booking_id: bookingModel.booking_id ?? -1), menthodApi: .put, parameters: params, encoding: JSONEncoding.default, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = UpdatedResponse.init(json: json.convertToDictionary()) {
//                                        complete?(response)
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in }
//        )
//    }
//}
//
//// MARK: - API History
//extension APIPortal {
//    func getHistory(fromeDate: Date?, toDate: Date?, pageIndex: Int, pageSize: Int, menthodApi: HTTPMethod, complete: ((HistoryResponse) -> Void)?, failure: ((String) -> Void)?) {
//        var params = [
//            "pageIndex": pageIndex,
//            "pageSize": pageSize
//            ] as [String: Any]
//        params["is-history"] = true
//        if let _fromDatedate = fromeDate {
//            var _date = _fromDatedate.toGlobalTime()
//            _date.hour = 0
//            _date.minute = 0
//            _date.second = 0
//            let mDateStr =  Date.dateToStringGlobalTime(date: _date, typeFormat: .dateTimeT)! + ".000Z"
//            params["fromDate"] =  mDateStr }
//        if let _toDate = toDate {
//            var _date  = _toDate
//            _date.hour = 23
//            _date.minute = 59
//            _date.second = 59
//            params["toDate"] = Date.dateToStringGlobalTime(date: _date, typeFormat: .dateTime)!
//
//        }
//        _ = self.requestApiWith(url: URL.urlHistory, menthodApi: .get, parameters: params, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = HistoryResponse.init(json: json.convertToDictionary()) {
//                                        complete?(response)
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in  }
//        )
//    }
//}
//
//// MARK: - API Hold Time
//extension APIPortal {
//
//    func createMultipleHoldTime(time_start_holding: Date,
//                                end_date_booking: Date,
//                                start_date_booking: Date,
//                                equipment_ids: [Int],
//                                user_id: Int,
//                                menthodApi: HTTPMethod,
//                                complete: ((HoldTimeResponse) -> Void)?,
//                                failure: ((ResponseObjects) -> Void)?) {
//
//        var params = [
//            "time_start_holding": time_start_holding.toString(.dateTime),
//            "equipment_ids": equipment_ids,
//            "user_id": user_id
//            ] as [String: Any]
//
//        if let delivery_date = Date.dateToStringGlobalTime(date: start_date_booking, typeFormat: .dateTime) { params["start_date_booking"] = delivery_date
//        }
//
//        if let _end_date_booking = Date.dateToStringGlobalTimeEndDay(date: end_date_booking, typeFormat: .dateTime) { params["end_date_booking"] = _end_date_booking
//        }
//
//        if let bookingID = BookData.shared.bookModel?.booking_id {
//            params["booking_id"] = bookingID
//        }
//
//        _ = self.requestApiWith(url: URL.urlMultipleHoldTime, menthodApi: .post, parameters: params, encoding: JSONEncoding.default, header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = HoldTimeResponse.init(json: json.convertToDictionary()) {
//                                        complete?(response)
//                                    } },
//                                fail: {  resError in
//                                    failure?(resError)
//        })
//    }
//
//    func cancelMultipleHoldTime(holding_id_list: [Int],
//                                menthodApi: HTTPMethod,
//                                complete: ((UpdatedResponse) -> Void)?,
//                                failure: ((String) -> Void)?) {
//        let params = ["holding_ids": holding_id_list] as [String: Any]
//
//        _ = self.requestApiWith(url: URL.urlCancleMultipleHoldTime,
//                                menthodApi: .delete,
//                                parameters: params,
//                                encoding: JSONEncoding.default,
//                                header: APIPortal.headers,
//                                complete: { (json) in
//                                    if let response = UpdatedResponse.init(json: json.convertToDictionary()) {
//                                        complete?(response)
//                                    } else {
//                                        failure?(R.string.localizable.server_error().localized())
//                                    }},
//                                fail: { _ in  }
//        )
//    }
//}
//// MARK: - API Holiday
//extension APIPortal {
//    func getHolidays( complete: ((HolidaysResponse) -> Void)?, failure: ((String) -> Void)?){
//        _ = self.requestApiWith(url: URL.urlGetHoliday, menthodApi: .get, parameters: nil, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                     complete: { (json) in
//                                         if let response = HolidaysResponse.init(json: json.convertToDictionary()) {
//                                             if response.isSuccess() {
//                                                 complete?(response)
//                                             } else {
//                                                 failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                             }
//                                         } else {
//                                             failure?(R.string.localizable.server_error().localized())
//                                         }},
//                                     fail: { _ in  }
//             )
//    }
//}
//
//// MARK: - API Color
//extension APIPortal {
//    func getColor( complete: ((ColorResponse) -> Void)?, failure: ((String) -> Void)?){
//        _ = self.requestApiWith(url: URL.urlGetColor, menthodApi: .get, parameters: nil, encoding: URLEncoding.queryString, header: APIPortal.headers,
//                                     complete: { (json) in
//                                         if let response = ColorResponse.init(json: json.convertToDictionary()) {
//                                             if response.isSuccess() {
//                                                 complete?(response)
//                                             } else {
//                                                 failure?(response.error?.getMessage() ?? R.string.localizable.server_error().localized())
//                                             }
//                                         } else {
//                                             failure?(R.string.localizable.server_error().localized())
//                                         }},
//                                     fail: { _ in }
//             )
//    }


}
