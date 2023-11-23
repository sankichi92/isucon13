node.reverse_merge!(
  rust: {
    user: "isucon",
  }
)

include_recipe 'rust::user' do
  user 'isucon'
end

#execute 'rustup default stable' do
#  user 'isucon'
#end
#
#execute 'cargo install cargo-binstall' do
#  user 'isucon'
#end
#
#execute 'cargo binstall tokio-console -y' do
#  user 'isucon'
#end
