class EntriesController < ApplicationController

  before_action :set_entity_params, except: ['stats']

  def create_tag
    @entity_tag = eval(params[:tags])
    Entry.where(entity_id: @entity_id, entity_type: @entity_type).destroy
    if Entry.create(entity_id: @entity_id, entity_tag: @entity_tag, entity_type: @entity_type)
      render status: 200, json: {message: 'success'}
    else
      render status: 400, json: {message: 'failure'}
    end
  end

  def retrieve_tag
    entry = Entry.where(entity_id: @entity_id, entity_type: @entity_type).first
    if entry
      render status: 200, json: {entry: entry, tags: entry.entity_tag, message: 'success'}
    else
      render status: 400, json: {message: 'failure'}
    end
  end

  def delete_tag
    if Entry.where(entity_id: @entity_id, entity_type: @entity_type).destroy
      render status: 200, json: {message: 'success'}
    else
      render status: 400, json: {message: 'failure'}
    end
  end

  def stats
    render status: 200, json: {tags: Entry.pluck(:entity_tag), message: 'success'}
  end

  def retrieve_stat
    entry = Entry.where(entity_id: @entity_id, entity_type: @entity_type).first
    if entry
      render status: 200, json: {tags: entry.entity_tag, message: 'success'}
    else
      render status: 400, json: {message: 'failure'}
    end
  end

  private

  def set_entity_params
    @entity_id = eval(params[:entity_id]).to_s
    @entity_type = eval(params[:entity_type]).to_s
  end

end