import MySQLdb

from kivy.config import Config
Config.set('graphics', 'resizable', 0)

from kivy.app import App
from kivy.uix.label import Label
from kivy.uix.widget import Widget
from kivy.uix.floatlayout import FloatLayout
from kivy.uix.anchorlayout import AnchorLayout
from kivy.uix.button import Button
from kivy.uix.textinput import TextInput
from kivy.uix.gridlayout import GridLayout
from kivy.uix.scrollview import ScrollView
from kivy.core.window import Window
from kivy.uix.dropdown import DropDown

b = MySQLdb.connect(host='152.20.234.248',
                    user='jtb9611',
                    passwd='5BWYH6fXO',
                    db='jtb9611')

cur = b.cursor()

cur.execute("Select * from songs")
result = cur.fetchall()

class Container(FloatLayout):
    def __init__(self, **kwargs):
        super(Container, self).__init__(**kwargs)

        # top menu bar
        topMenu = GridLayout(cols= 2, spacing=5)
        anchor_lc = AnchorLayout(anchor_x='left', anchor_y='top')

        dropdown = DropDown()
        btn1 = Button(text='CD', size_hint_y=None, height=50)
        btn1.bind(on_release=lambda btn1: dropdown.select(btn1.text))
        dropdown.add_widget(btn1)
        btn2 = Button(text='Song', size_hint_y=None, height=50)
        btn2.bind(on_release=lambda btn2: dropdown.select(btn2.text))
        dropdown.add_widget(btn2)
        mainbutton = Button(text='Search for...', size_hint=(None, None), height=50)
        mainbutton.bind(on_release=dropdown.open)
        dropdown.bind(on_select=lambda instance, x: setattr(mainbutton, 'text', x))
        topMenu.add_widget(mainbutton)

        txtInp = TextInput(text='', size=(200, 50), size_hint=(None, None), multiline=False)
        topMenu.add_widget(txtInp)

        anchor_lc.add_widget(topMenu)
        self.add_widget(anchor_lc)
        # end top menu bar shit

        anchor_lc = AnchorLayout(anchor_x='center', anchor_y='center')
        results = GridLayout(cols=1, spacing=10, size_hint_y=None)
        results.bind(minimum_height=results.setter('height'))

        for i in range(len(result)):
            lbl = Label(text=result[i][1], size_hint_y=None, height=30)
            results.add_widget(lbl)
        root = ScrollView(size_hint=(1, .5))
        root.add_widget(results)
        anchor_lc.add_widget(root)
        self.add_widget(anchor_lc)


class MyJB(App):
    def build(self):
        parent = Container()
        return parent

if __name__ == '__main__':
    MyJB().run()
