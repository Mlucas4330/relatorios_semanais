class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :codigo
      t.text :descricao
      t.time :hora_inicio
      t.time :hora_fim
      t.string :dia_semana
      t.string :status

      t.timestamps
    end
  end
end
