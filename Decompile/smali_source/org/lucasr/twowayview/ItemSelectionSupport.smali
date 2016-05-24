.class public Lorg/lucasr/twowayview/ItemSelectionSupport;
.super Ljava/lang/Object;
.source "ItemSelectionSupport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/lucasr/twowayview/ItemSelectionSupport$1;,
        Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;,
        Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;,
        Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;
    }
.end annotation


# instance fields
.field private mCheckedCount:I

.field private mCheckedIdStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;

.field private mCheckedStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;

.field private mChoiceMode:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

.field private final mRecyclerView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public static from(Landroid/support/v7/widget/RecyclerView;)Lorg/lucasr/twowayview/ItemSelectionSupport;
    .registers 2
    .param p0, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 371
    if-nez p0, :cond_4

    .line 372
    const/4 v0, 0x0

    .line 375
    :goto_3
    return-object v0

    :cond_4
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->twowayview_item_selection_support:I

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/ItemSelectionSupport;

    goto :goto_3
.end method

.method private updateOnScreenCheckedViews()V
    .registers 6

    .prologue
    .line 51
    iget-object v4, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v1

    .line 52
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-ge v2, v1, :cond_21

    .line 53
    iget-object v4, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v2}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 54
    .local v0, "child":Landroid/view/View;
    iget-object v4, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/RecyclerView;->getChildPosition(Landroid/view/View;)I

    move-result v3

    .line 55
    .local v3, "position":I
    iget-object v4, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;

    invoke-virtual {v4, v3}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;->get(I)Z

    move-result v4

    invoke-virtual {p0, v0, v4}, Lorg/lucasr/twowayview/ItemSelectionSupport;->setViewChecked(Landroid/view/View;Z)V

    .line 52
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 57
    .end local v0    # "child":Landroid/view/View;
    .end local v3    # "position":I
    :cond_21
    return-void
.end method


# virtual methods
.method public clearChoices()V
    .registers 2

    .prologue
    .line 233
    iget-object v0, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;

    if-eqz v0, :cond_9

    .line 234
    iget-object v0, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;

    invoke-virtual {v0}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;->clear()V

    .line 237
    :cond_9
    iget-object v0, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedIdStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;

    if-eqz v0, :cond_12

    .line 238
    iget-object v0, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedIdStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;

    invoke-virtual {v0}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;->clear()V

    .line 241
    :cond_12
    const/4 v0, 0x0

    iput v0, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedCount:I

    .line 242
    invoke-direct {p0}, Lorg/lucasr/twowayview/ItemSelectionSupport;->updateOnScreenCheckedViews()V

    .line 243
    return-void
.end method

.method public isItemChecked(I)Z
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 88
    iget-object v0, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mChoiceMode:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    sget-object v1, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;->NONE:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    if-eq v0, v1, :cond_11

    iget-object v0, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;

    if-eqz v0, :cond_11

    .line 89
    iget-object v0, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;

    invoke-virtual {v0, p1}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;->get(I)Z

    move-result v0

    .line 92
    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public onAdapterDataChanged()V
    .registers 19

    .prologue
    .line 283
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v2

    .line 284
    .local v2, "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mChoiceMode:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    move-object/from16 v16, v0

    sget-object v17, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;->NONE:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    if-eq v0, v1, :cond_20

    if-eqz v2, :cond_20

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$Adapter;->hasStableIds()Z

    move-result v16

    if-nez v16, :cond_21

    .line 323
    :cond_20
    return-void

    .line 288
    :cond_21
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v9

    .line 291
    .local v9, "itemCount":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;->clear()V

    .line 293
    const/4 v3, 0x0

    .local v3, "checkedIndex":I
    :goto_2f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedIdStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;->size()I

    move-result v16

    move/from16 v0, v16

    if-ge v3, v0, :cond_20

    .line 294
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedIdStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;->keyAt(I)J

    move-result-wide v4

    .line 295
    .local v4, "currentId":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedIdStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;->valueAt(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Integer;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 297
    .local v6, "currentPosition":I
    invoke-virtual {v2, v6}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v10

    .line 298
    .local v10, "newPositionId":J
    cmp-long v16, v4, v10

    if-eqz v16, :cond_c4

    .line 300
    const/16 v16, 0x0

    add-int/lit8 v17, v6, -0x14

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->max(II)I

    move-result v15

    .line 301
    .local v15, "start":I
    add-int/lit8 v16, v6, 0x14

    move/from16 v0, v16

    invoke-static {v0, v9}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 303
    .local v7, "end":I
    const/4 v8, 0x0

    .line 304
    .local v8, "found":Z
    move v14, v15

    .local v14, "searchPos":I
    :goto_75
    if-ge v14, v7, :cond_a0

    .line 305
    invoke-virtual {v2, v14}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v12

    .line 306
    .local v12, "searchId":J
    cmp-long v16, v4, v12

    if-nez v16, :cond_c1

    .line 307
    const/4 v8, 0x1

    .line 308
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v0, v14, v1}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;->put(IZ)V

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedIdStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;

    move-object/from16 v16, v0

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v3, v1}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;->setValueAt(ILjava/lang/Object;)V

    .line 314
    .end local v12    # "searchId":J
    :cond_a0
    if-nez v8, :cond_bd

    .line 315
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedIdStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v4, v5}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;->delete(J)V

    .line 316
    move-object/from16 v0, p0

    iget v0, v0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedCount:I

    move/from16 v16, v0

    add-int/lit8 v16, v16, -0x1

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedCount:I

    .line 317
    add-int/lit8 v3, v3, -0x1

    .line 293
    .end local v7    # "end":I
    .end local v8    # "found":Z
    .end local v14    # "searchPos":I
    .end local v15    # "start":I
    :cond_bd
    :goto_bd
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_2f

    .line 304
    .restart local v7    # "end":I
    .restart local v8    # "found":Z
    .restart local v12    # "searchId":J
    .restart local v14    # "searchPos":I
    .restart local v15    # "start":I
    :cond_c1
    add-int/lit8 v14, v14, 0x1

    goto :goto_75

    .line 320
    .end local v7    # "end":I
    .end local v8    # "found":Z
    .end local v12    # "searchId":J
    .end local v14    # "searchPos":I
    .end local v15    # "start":I
    :cond_c4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v0, v6, v1}, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;->put(IZ)V

    goto :goto_bd
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 337
    invoke-static {}, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;->values()[Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    move-result-object v0

    const-string v1, "choiceMode"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    aget-object v0, v0, v1

    iput-object v0, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mChoiceMode:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    .line 338
    const-string v0, "checkedStates"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;

    iput-object v0, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;

    .line 339
    const-string v0, "checkedIdStates"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;

    iput-object v0, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedIdStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;

    .line 340
    const-string v0, "checkedCount"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedCount:I

    .line 343
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .registers 4

    .prologue
    .line 326
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 328
    .local v0, "state":Landroid/os/Bundle;
    const-string v1, "choiceMode"

    iget-object v2, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mChoiceMode:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    invoke-virtual {v2}, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;->ordinal()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 329
    const-string v1, "checkedStates"

    iget-object v2, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedStates;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 330
    const-string v1, "checkedIdStates"

    iget-object v2, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedIdStates:Lorg/lucasr/twowayview/ItemSelectionSupport$CheckedIdStates;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 331
    const-string v1, "checkedCount"

    iget v2, p0, Lorg/lucasr/twowayview/ItemSelectionSupport;->mCheckedCount:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 333
    return-object v0
.end method

.method public setViewChecked(Landroid/view/View;Z)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "checked"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 222
    instance-of v0, p1, Landroid/widget/Checkable;

    if-eqz v0, :cond_a

    .line 223
    check-cast p1, Landroid/widget/Checkable;

    .end local p1    # "view":Landroid/view/View;
    invoke-interface {p1, p2}, Landroid/widget/Checkable;->setChecked(Z)V

    .line 227
    :cond_9
    :goto_9
    return-void

    .line 224
    .restart local p1    # "view":Landroid/view/View;
    :cond_a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_9

    .line 225
    invoke-virtual {p1, p2}, Landroid/view/View;->setActivated(Z)V

    goto :goto_9
.end method
