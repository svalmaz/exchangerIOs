import SwiftUI

struct OneIconButton: View {
    var text: String
    let action: () -> Void
    let textColor: Color
    let backColor: Color
    let icon: String
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(textColor)
                    .frame(width: 20, height: 20)
                    .padding(.leading, 10) // Добавим отступ слева для иконки
                
                Text(text)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
                    .padding(.trailing, 10) // Добавим отступ справа для текста
            }
            .frame(maxWidth: .infinity) // Позволим HStack занять всю ширину
            .padding()
            .background(backColor)
            .cornerRadius(15)
        }
        .padding(.horizontal)
        .animation(.easeInOut(duration: 0.4))
        .transition(.opacity)
    }
}

struct OneIconButton_Previews: PreviewProvider {
    static var previews: some View {
        OneIconButton(text: "Sample Text", action: {}, textColor: .white, backColor: .blue, icon: "star.fill")
    }
}
