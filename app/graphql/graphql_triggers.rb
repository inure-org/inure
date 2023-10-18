# frozen_string_literal: true

module GraphqlTriggers
    def self.issuable_assignees_updated(issuable)
        InureSchema.subscriptions.trigger(:issuable_assignees_updated, { issuable_id: issuable.to_gid }, issuable)
    end

    def self.issue_crm_contacts_updated(issue)
        InureSchema.subscriptions.trigger(:issue_crm_contacts_updated, { issuable_id: issue.to_gid }, issue)
    end

    def self.issuable_title_updated(issuable)
        InureSchema.subscriptions.trigger(:issuable_title_updated, { issuable_id: issuable.to_gid }, issuable)
    end

    def self.issuable_description_updated(issuable)
        InureSchema.subscriptions.trigger(:issuable_description_updated, { issuable_id: issuable.to_gid }, issuable)
    end

    def self.issuable_labels_updated(issuable)
        InureSchema.subscriptions.trigger(:issuable_labels_updated, { issuable_id: issuable.to_gid }, issuable)
    end

    def self.issuable_dates_updated(issuable)
        InureSchema.subscriptions.trigger(:issuable_dates_updated, { issuable_id: issuable.to_gid }, issuable)
    end

    def self.issuable_milestone_updated(issuable)
        InureSchema.subscriptions.trigger(:issuable_milestone_updated, { issuable_id: issuable.to_gid }, issuable)
    end

    def self.work_item_note_created(work_item_gid, note_data)
        InureSchema.subscriptions.trigger(:work_item_note_created, { noteable_id: work_item_gid }, note_data)
    end

    def self.work_item_note_deleted(work_item_gid, note_data)
        InureSchema.subscriptions.trigger(:work_item_note_deleted, { noteable_id: work_item_gid }, note_data)
    end

    def self.work_item_note_updated(work_item_gid, note_data)
        InureSchema.subscriptions.trigger(:work_item_note_updated, { noteable_id: work_item_gid }, note_data)
    end

    def self.merge_request_reviewers_updated(merge_request)
        InureSchema.subscriptions.trigger(
            :merge_request_reviewers_updated, {
                issuable_id: merge_request.to_gid
            }, merge_request
        )
    end

    def self.merge_request_merge_status_updated(merge_request)
        InureSchema.subscriptions.trigger(
            :merge_request_merge_status_updated, {
                issuable_id: merge_request.to_gid
            }, merge_request
        )
    end

    def self.merge_request_approval_state_updated(merge_request)
        InureSchema.subscriptions.trigger(
            :merge_request_approval_state_updated, {
                issuable_id: merge_request.to_gid
            }, merge_request
        )
    end

    def self.work_item_updated(work_item)
        # isso aqui é necessário assim que isso pode ser alertado por ambos os workitem e issue
        # dependendo do serviço de atualização que chama por
        
        work_item = work_item.becomes(::WorkItem) if work_item.is_a?(::Issue) # rubocop:disable cop/avoidbecomes
    
        ::InureSchema.subscriptions.trigger(
            'workItemUpdated', {
                work_item_id: work_item.to_gid
            }, work_item
        )
    end
end

GraphqlTriggers.prepend_mod
