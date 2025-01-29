//
//  TrackableScrollView.swift
//  CombineDataPro
//
//  Created by Sothesom on 10/11/1403.
//

///پیدا کردن این مقدار افست برای ایجاد افکت تاری زمانی که اسکرول رو بالا میکنیم کاربر حس کنه تهشه

import SwiftUI

// مقدار اسکرول رو ردیابی میکنه -> هر تغییر افست رو به یه کلوزر میفرسته
struct TrackableScrollView<Content: View>: View {
    // جهت حرکت
    let axes: Axis.Set
    // مفدار افست
    let offsetChanged: (CGPoint) -> Void
    // محتوای داخل اسکرول ویو
    let content: Content

    init(
        axes: Axis.Set = .vertical,
        // مقدار پیشفر تغییرات افست خالیه که اکه اگه تغییر نکرد افستی به کلوزر نده که برنامه کرش نکنه
        offsetChanged: @escaping (CGPoint) -> Void = { _ in },
        // این یعنی چندین ویو را می‌توان مستقیماً درون این کلوزر قرار داد، بدون اینکه مجبور باشیم از VStack یا HStack استفاده کنیم
        @ViewBuilder content: () -> Content
    ) {
        self.axes = axes
        self.offsetChanged = offsetChanged
        self.content = content()
    }
    
    var body: some View {
        SwiftUI.ScrollView(axes) {
            //  برای گرفتن مقدار اسکرول
            GeometryReader { geometry in
                Color.clear.preference(
                    key: ScrollOffsetPreferenceKey.self,
                    value: geometry.frame(in: .named("scrollView")).origin
                )
            }
            .frame(width: 0, height: 0)
            
            content
        }
        //  برای دریافت مختصات دقیق
        .coordinateSpace(name: "scrollView")
        // دریافت مقدار offset در هنگام تغییر اسکرول
        .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: offsetChanged)
    }
}


//  برای ذخیره مقدار اسکرول
private struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}
