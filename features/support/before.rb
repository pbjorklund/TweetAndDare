OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  provider: 'twitter',
  uid: '19505451',
  :info => { name: 'Patrik Bjorklund', image: 'http://a0.twimg.com/profile_images/1419130846/196443_10150169133732184_712952183_8707081_374093_n_normal.jpg', nickname: 'cucumberpbjorklund', description: "Rockin and rolling" },
  :credentials => { token: "877548276-qO75yrqaBv0cPUFLitXEwJ2IjSF5sD79gyMtgNq0", secret: "1W17FPJ0wWn3oDW8oAxqumRTcZyMxCqyh6AD3PC4p8"
  }})

Before('@logged_in') do
  visit "/auth/twitter"
end
