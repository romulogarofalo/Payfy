defmodule Payfy.Raffle.Join do

  alias Payfy.Raffle.Get
  alias Payfy.Jobs.JoinRaffle

  def run(params) do
    # usuários não devem poder entrar em sorteios após a data do sorteio
    # cada usuário só pode participar uma unica vez do sorteio
    # deve-se considerar que devido a api ser publica, pode ser que tenhamos muitos sorteios sendo criados concorrentementes
    # deve-se considerar que pessoas famosas porem criar sorteios muito populares aonde teriam muitos usuários se cadastrando ao mesmo tempo e participando do sistema. O sistema não pode cair nesses casos, ou falhar em respeitar as regras acima.
    %{"raffle_id" => raffle_id} = params

    {:ok, raffle_map} = Get.run(raffle_id)

    if Date.diff(raffle_map.limit_date, Date.utc_today()) do
      JoinRaffle.new(params)
      |> Oban.insert!()
    else
      {:error, "is not possible join a raffle after the date"}
    end
  end
end
