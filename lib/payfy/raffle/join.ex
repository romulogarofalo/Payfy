defmodule Payfy.Raffle.Join do

  alias Payfy.Raffle.Get
  alias Payfy.Raffle

  def run(%{user_id: user_id, raffle_id: raffle_id}) do
  # usuários não devem poder entrar em sorteios após a data do sorteio
  # cada usuário só pode participar uma unica vez do sorteio
  # deve-se considerar que devido a api ser publica, pode ser que tenhamos muitos sorteios sendo criados concorrentementes
  # deve-se considerar que pessoas famosas porem criar sorteios muito populares aonde teriam muitos usuários se cadastrando ao mesmo tempo e participando do sistema. O sistema não pode cair nesses casos, ou falhar em respeitar as regras acima.
    {:ok, raffle_map} = Get.run(raffle_id)

    # if raffle_map.limit_date < today do
    #   Raffle.join_ruffle(user_id, raffle_map)
    #   |> Payfy.Repo.insert!()
    # else
    #   {:error, "is not possible join a raffle after the date"}
    # end
  end
end
