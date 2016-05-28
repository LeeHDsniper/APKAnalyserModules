.class Landroid/support/v7/widget/AdapterHelper;
.super Ljava/lang/Object;
.source "AdapterHelper.java"

# interfaces
.implements Landroid/support/v7/widget/OpReorderer$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/AdapterHelper$Callback;,
        Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    }
.end annotation


# instance fields
.field final mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

.field final mDisableRecycler:Z

.field mOnItemProcessedCallback:Ljava/lang/Runnable;

.field final mOpReorderer:Landroid/support/v7/widget/OpReorderer;

.field final mPendingUpdates:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;"
        }
    .end annotation
.end field

.field final mPostponedList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;"
        }
    .end annotation
.end field

.field private mUpdateOpPool:Landroid/support/v4/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/Pools$Pool",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/support/v7/widget/AdapterHelper$Callback;)V
    .registers 3
    .param p1, "callback"    # Landroid/support/v7/widget/AdapterHelper$Callback;

    .prologue
    .line 71
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/AdapterHelper;-><init>(Landroid/support/v7/widget/AdapterHelper$Callback;Z)V

    .line 72
    return-void
.end method

.method constructor <init>(Landroid/support/v7/widget/AdapterHelper$Callback;Z)V
    .registers 5
    .param p1, "callback"    # Landroid/support/v7/widget/AdapterHelper$Callback;
    .param p2, "disableRecycler"    # Z

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Landroid/support/v4/util/Pools$SimplePool;

    const/16 v1, 0x1e

    invoke-direct {v0, v1}, Landroid/support/v4/util/Pools$SimplePool;-><init>(I)V

    iput-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mUpdateOpPool:Landroid/support/v4/util/Pools$Pool;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    .line 75
    iput-object p1, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    .line 76
    iput-boolean p2, p0, Landroid/support/v7/widget/AdapterHelper;->mDisableRecycler:Z

    .line 77
    new-instance v0, Landroid/support/v7/widget/OpReorderer;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/OpReorderer;-><init>(Landroid/support/v7/widget/OpReorderer$Callback;)V

    iput-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mOpReorderer:Landroid/support/v7/widget/OpReorderer;

    .line 78
    return-void
.end method

.method private applyAdd(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 2
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    .line 425
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 426
    return-void
.end method

.method private applyMove(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 2
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    .line 127
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 128
    return-void
.end method

.method private applyRemove(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 13
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    const/4 v10, 0x1

    .line 131
    iget v4, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 132
    .local v4, "tmpStart":I
    const/4 v2, 0x0

    .line 133
    .local v2, "tmpCount":I
    iget v8, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v9, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int v3, v8, v9

    .line 134
    .local v3, "tmpEnd":I
    const/4 v5, -0x1

    .line 135
    .local v5, "type":I
    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .local v1, "position":I
    :goto_d
    if-ge v1, v3, :cond_40

    .line 136
    const/4 v6, 0x0

    .line 137
    .local v6, "typeChanged":Z
    iget-object v8, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v8, v1}, Landroid/support/v7/widget/AdapterHelper$Callback;->findViewHolder(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v7

    .line 138
    .local v7, "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-nez v7, :cond_1e

    invoke-direct {p0, v1}, Landroid/support/v7/widget/AdapterHelper;->canFindInPreLayout(I)Z

    move-result v8

    if-eqz v8, :cond_31

    .line 145
    :cond_1e
    if-nez v5, :cond_28

    .line 148
    invoke-virtual {p0, v10, v4, v2}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(III)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v0

    .line 149
    .local v0, "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-direct {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 150
    const/4 v6, 0x1

    .line 152
    .end local v0    # "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_28
    const/4 v5, 0x1

    .line 165
    :goto_29
    if-eqz v6, :cond_3d

    .line 166
    sub-int/2addr v1, v2

    .line 167
    sub-int/2addr v3, v2

    .line 168
    const/4 v2, 0x1

    .line 135
    :goto_2e
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 156
    :cond_31
    if-ne v5, v10, :cond_3b

    .line 159
    invoke-virtual {p0, v10, v4, v2}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(III)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v0

    .line 160
    .restart local v0    # "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-direct {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 161
    const/4 v6, 0x1

    .line 163
    .end local v0    # "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_3b
    const/4 v5, 0x0

    goto :goto_29

    .line 170
    :cond_3d
    add-int/lit8 v2, v2, 0x1

    goto :goto_2e

    .line 173
    .end local v6    # "typeChanged":Z
    .end local v7    # "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_40
    iget v8, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-eq v2, v8, :cond_4b

    .line 174
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 175
    invoke-virtual {p0, v10, v4, v2}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(III)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object p1

    .line 177
    :cond_4b
    if-nez v5, :cond_51

    .line 178
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 182
    :goto_50
    return-void

    .line 180
    :cond_51
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_50
.end method

.method private applyUpdate(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 12
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    const/4 v9, 0x2

    .line 185
    iget v4, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 186
    .local v4, "tmpStart":I
    const/4 v2, 0x0

    .line 187
    .local v2, "tmpCount":I
    iget v7, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v8, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int v3, v7, v8

    .line 188
    .local v3, "tmpEnd":I
    const/4 v5, -0x1

    .line 189
    .local v5, "type":I
    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .local v1, "position":I
    :goto_d
    if-ge v1, v3, :cond_3c

    .line 190
    iget-object v7, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v7, v1}, Landroid/support/v7/widget/AdapterHelper$Callback;->findViewHolder(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v6

    .line 191
    .local v6, "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-nez v6, :cond_1d

    invoke-direct {p0, v1}, Landroid/support/v7/widget/AdapterHelper;->canFindInPreLayout(I)Z

    move-result v7

    if-eqz v7, :cond_2e

    .line 192
    :cond_1d
    if-nez v5, :cond_28

    .line 193
    invoke-virtual {p0, v9, v4, v2}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(III)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v0

    .line 194
    .local v0, "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-direct {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 195
    const/4 v2, 0x0

    .line 196
    move v4, v1

    .line 198
    .end local v0    # "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_28
    const/4 v5, 0x1

    .line 208
    :goto_29
    add-int/lit8 v2, v2, 0x1

    .line 189
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 200
    :cond_2e
    const/4 v7, 0x1

    if-ne v5, v7, :cond_3a

    .line 201
    invoke-virtual {p0, v9, v4, v2}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(III)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v0

    .line 202
    .restart local v0    # "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-direct {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 203
    const/4 v2, 0x0

    .line 204
    move v4, v1

    .line 206
    .end local v0    # "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_3a
    const/4 v5, 0x0

    goto :goto_29

    .line 210
    .end local v6    # "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_3c
    iget v7, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-eq v2, v7, :cond_47

    .line 211
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 212
    invoke-virtual {p0, v9, v4, v2}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(III)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object p1

    .line 214
    :cond_47
    if-nez v5, :cond_4d

    .line 215
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 219
    :goto_4c
    return-void

    .line 217
    :cond_4d
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_4c
.end method

.method private canFindInPreLayout(I)Z
    .registers 10
    .param p1, "position"    # I

    .prologue
    const/4 v5, 0x1

    .line 404
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 405
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    if-ge v2, v0, :cond_3e

    .line 406
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 407
    .local v3, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v7, 0x3

    if-ne v6, v7, :cond_22

    .line 408
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p0, v6, v7}, Landroid/support/v7/widget/AdapterHelper;->findPositionOffset(II)I

    move-result v6

    if-ne v6, p1, :cond_3b

    .line 421
    .end local v3    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_21
    :goto_21
    return v5

    .line 411
    .restart local v3    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_22
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-nez v6, :cond_3b

    .line 413
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v7, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int v1, v6, v7

    .line 414
    .local v1, "end":I
    iget v4, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .local v4, "pos":I
    :goto_2e
    if-ge v4, v1, :cond_3b

    .line 415
    add-int/lit8 v6, v2, 0x1

    invoke-virtual {p0, v4, v6}, Landroid/support/v7/widget/AdapterHelper;->findPositionOffset(II)I

    move-result v6

    if-eq v6, p1, :cond_21

    .line 414
    add-int/lit8 v4, v4, 0x1

    goto :goto_2e

    .line 405
    .end local v1    # "end":I
    .end local v4    # "pos":I
    :cond_3b
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 421
    .end local v3    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_3e
    const/4 v5, 0x0

    goto :goto_21
.end method

.method private dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 15
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 225
    iget v11, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-eqz v11, :cond_b

    iget v11, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v12, 0x3

    if-ne v11, v12, :cond_13

    .line 226
    :cond_b
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "should not dispatch add or move for pre layout"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 239
    :cond_13
    iget v11, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v12, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    invoke-direct {p0, v11, v12}, Landroid/support/v7/widget/AdapterHelper;->updatePositionWithPostponed(II)I

    move-result v7

    .line 243
    .local v7, "tmpStart":I
    const/4 v6, 0x1

    .line 244
    .local v6, "tmpCnt":I
    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 246
    .local v1, "offsetPositionForPartial":I
    iget v11, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v11, :pswitch_data_92

    .line 254
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "op should be remove or update."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 248
    :pswitch_3c
    const/4 v4, 0x1

    .line 256
    .local v4, "positionMultiplier":I
    :goto_3d
    const/4 v2, 0x1

    .local v2, "p":I
    :goto_3e
    iget v11, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-ge v2, v11, :cond_80

    .line 257
    iget v11, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    mul-int v12, v4, v2

    add-int v3, v11, v12

    .line 258
    .local v3, "pos":I
    iget v11, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    invoke-direct {p0, v3, v11}, Landroid/support/v7/widget/AdapterHelper;->updatePositionWithPostponed(II)I

    move-result v8

    .line 262
    .local v8, "updatedPos":I
    const/4 v0, 0x0

    .line 263
    .local v0, "continuous":Z
    iget v11, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v11, :pswitch_data_9a

    .line 271
    :goto_54
    if-eqz v0, :cond_6b

    .line 272
    add-int/lit8 v6, v6, 0x1

    .line 256
    :goto_58
    add-int/lit8 v2, v2, 0x1

    goto :goto_3e

    .line 251
    .end local v0    # "continuous":Z
    .end local v2    # "p":I
    .end local v3    # "pos":I
    .end local v4    # "positionMultiplier":I
    .end local v8    # "updatedPos":I
    :pswitch_5b
    const/4 v4, 0x0

    .line 252
    .restart local v4    # "positionMultiplier":I
    goto :goto_3d

    .line 265
    .restart local v0    # "continuous":Z
    .restart local v2    # "p":I
    .restart local v3    # "pos":I
    .restart local v8    # "updatedPos":I
    :pswitch_5d
    add-int/lit8 v11, v7, 0x1

    if-ne v8, v11, :cond_63

    move v0, v9

    .line 266
    :goto_62
    goto :goto_54

    :cond_63
    move v0, v10

    .line 265
    goto :goto_62

    .line 268
    :pswitch_65
    if-ne v8, v7, :cond_69

    move v0, v9

    :goto_68
    goto :goto_54

    :cond_69
    move v0, v10

    goto :goto_68

    .line 275
    :cond_6b
    iget v11, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    invoke-virtual {p0, v11, v7, v6}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(III)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v5

    .line 279
    .local v5, "tmp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-virtual {p0, v5, v1}, Landroid/support/v7/widget/AdapterHelper;->dispatchFirstPassAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;I)V

    .line 280
    invoke-virtual {p0, v5}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 281
    iget v11, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v12, 0x2

    if-ne v11, v12, :cond_7d

    .line 282
    add-int/2addr v1, v6

    .line 284
    :cond_7d
    move v7, v8

    .line 285
    const/4 v6, 0x1

    goto :goto_58

    .line 288
    .end local v0    # "continuous":Z
    .end local v3    # "pos":I
    .end local v5    # "tmp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .end local v8    # "updatedPos":I
    :cond_80
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 289
    if-lez v6, :cond_91

    .line 290
    iget v9, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    invoke-virtual {p0, v9, v7, v6}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(III)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v5

    .line 294
    .restart local v5    # "tmp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-virtual {p0, v5, v1}, Landroid/support/v7/widget/AdapterHelper;->dispatchFirstPassAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;I)V

    .line 295
    invoke-virtual {p0, v5}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 305
    .end local v5    # "tmp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_91
    return-void

    .line 246
    :pswitch_data_92
    .packed-switch 0x1
        :pswitch_5b
        :pswitch_3c
    .end packed-switch

    .line 263
    :pswitch_data_9a
    .packed-switch 0x1
        :pswitch_65
        :pswitch_5d
    .end packed-switch
.end method

.method private postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 5
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    .line 432
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 433
    iget v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v0, :pswitch_data_4c

    .line 448
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown update op type for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 435
    :pswitch_23
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, v1, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForAdd(II)V

    .line 450
    :goto_2c
    return-void

    .line 438
    :pswitch_2d
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, v1, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForMove(II)V

    goto :goto_2c

    .line 441
    :pswitch_37
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, v1, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForRemovingLaidOutOrNewView(II)V

    goto :goto_2c

    .line 445
    :pswitch_41
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, v1, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->markViewHoldersUpdated(II)V

    goto :goto_2c

    .line 433
    nop

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_23
        :pswitch_37
        :pswitch_41
        :pswitch_2d
    .end packed-switch
.end method

.method private updatePositionWithPostponed(II)I
    .registers 13
    .param p1, "pos"    # I
    .param p2, "cmd"    # I

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x1

    .line 323
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 324
    .local v0, "count":I
    add-int/lit8 v2, v0, -0x1

    .local v2, "i":I
    :goto_a
    if-ltz v2, :cond_a1

    .line 325
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 326
    .local v4, "postponed":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-ne v6, v9, :cond_7b

    .line 328
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v7, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-ge v6, v7, :cond_37

    .line 329
    iget v5, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 330
    .local v5, "start":I
    iget v1, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    .line 335
    .local v1, "end":I
    :goto_22
    if-lt p1, v5, :cond_59

    if-gt p1, v1, :cond_59

    .line 337
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ne v5, v6, :cond_45

    .line 338
    if-nez p2, :cond_3c

    .line 339
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    .line 344
    :cond_32
    :goto_32
    add-int/lit8 p1, p1, 0x1

    .line 324
    .end local v1    # "end":I
    .end local v5    # "start":I
    :cond_34
    :goto_34
    add-int/lit8 v2, v2, -0x1

    goto :goto_a

    .line 332
    :cond_37
    iget v5, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    .line 333
    .restart local v5    # "start":I
    iget v1, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .restart local v1    # "end":I
    goto :goto_22

    .line 340
    :cond_3c
    if-ne p2, v8, :cond_32

    .line 341
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_32

    .line 346
    :cond_45
    if-nez p2, :cond_50

    .line 347
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 352
    :cond_4d
    :goto_4d
    add-int/lit8 p1, p1, -0x1

    goto :goto_34

    .line 348
    :cond_50
    if-ne p2, v8, :cond_4d

    .line 349
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_4d

    .line 354
    :cond_59
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ge p1, v6, :cond_34

    .line 356
    if-nez p2, :cond_6c

    .line 357
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 358
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_34

    .line 359
    :cond_6c
    if-ne p2, v8, :cond_34

    .line 360
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 361
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_34

    .line 365
    .end local v1    # "end":I
    .end local v5    # "start":I
    :cond_7b
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v6, p1, :cond_8f

    .line 366
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-nez v6, :cond_87

    .line 367
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr p1, v6

    goto :goto_34

    .line 368
    :cond_87
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-ne v6, v8, :cond_34

    .line 369
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr p1, v6

    goto :goto_34

    .line 372
    :cond_8f
    if-nez p2, :cond_98

    .line 373
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_34

    .line 374
    :cond_98
    if-ne p2, v8, :cond_34

    .line 375
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_34

    .line 388
    .end local v4    # "postponed":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_a1
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/lit8 v2, v6, -0x1

    :goto_a9
    if-ltz v2, :cond_d9

    .line 389
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 390
    .local v3, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-ne v6, v9, :cond_cc

    .line 391
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v7, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-eq v6, v7, :cond_c1

    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-gez v6, :cond_c9

    .line 392
    :cond_c1
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 393
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 388
    :cond_c9
    :goto_c9
    add-int/lit8 v2, v2, -0x1

    goto :goto_a9

    .line 395
    :cond_cc
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-gtz v6, :cond_c9

    .line 396
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 397
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_c9

    .line 400
    .end local v3    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_d9
    return p1
.end method


# virtual methods
.method public applyPendingUpdatesToPosition(I)I
    .registers 8
    .param p1, "position"    # I

    .prologue
    .line 563
    iget-object v4, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 564
    .local v3, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v3, :cond_2e

    .line 565
    iget-object v4, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 566
    .local v2, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v4, :pswitch_data_48

    .line 564
    :cond_16
    :goto_16
    :pswitch_16
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 568
    :pswitch_19
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v4, p1, :cond_16

    .line 569
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr p1, v4

    goto :goto_16

    .line 573
    :pswitch_21
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v4, p1, :cond_16

    .line 574
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int v0, v4, v5

    .line 575
    .local v0, "end":I
    if-le v0, p1, :cond_2f

    .line 576
    const/4 p1, -0x1

    .line 595
    .end local v0    # "end":I
    .end local v2    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .end local p1    # "position":I
    :cond_2e
    return p1

    .line 578
    .restart local v0    # "end":I
    .restart local v2    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .restart local p1    # "position":I
    :cond_2f
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr p1, v4

    .line 579
    goto :goto_16

    .line 582
    .end local v0    # "end":I
    :pswitch_33
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ne v4, p1, :cond_3a

    .line 583
    iget p1, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_16

    .line 585
    :cond_3a
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ge v4, p1, :cond_40

    .line 586
    add-int/lit8 p1, p1, -0x1

    .line 588
    :cond_40
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-gt v4, p1, :cond_16

    .line 589
    add-int/lit8 p1, p1, 0x1

    goto :goto_16

    .line 566
    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_19
        :pswitch_21
        :pswitch_16
        :pswitch_33
    .end packed-switch
.end method

.method consumePostponedUpdates()V
    .registers 5

    .prologue
    .line 117
    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 118
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v0, :cond_19

    .line 119
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 118
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 121
    :cond_19
    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOpsAndClearList(Ljava/util/List;)V

    .line 122
    return-void
.end method

.method consumeUpdatesInOnePass()V
    .registers 7

    .prologue
    .line 533
    invoke-virtual {p0}, Landroid/support/v7/widget/AdapterHelper;->consumePostponedUpdates()V

    .line 534
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 535
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    if-ge v1, v0, :cond_61

    .line 536
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 537
    .local v2, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v3, :pswitch_data_68

    .line 555
    :goto_19
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOnItemProcessedCallback:Ljava/lang/Runnable;

    if-eqz v3, :cond_22

    .line 556
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOnItemProcessedCallback:Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 535
    :cond_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 539
    :pswitch_25
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 540
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v3, v4, v5}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForAdd(II)V

    goto :goto_19

    .line 543
    :pswitch_34
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 544
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v3, v4, v5}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForRemovingInvisible(II)V

    goto :goto_19

    .line 547
    :pswitch_43
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 548
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v3, v4, v5}, Landroid/support/v7/widget/AdapterHelper$Callback;->markViewHoldersUpdated(II)V

    goto :goto_19

    .line 551
    :pswitch_52
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 552
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v3, v4, v5}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForMove(II)V

    goto :goto_19

    .line 559
    .end local v2    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_61
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOpsAndClearList(Ljava/util/List;)V

    .line 560
    return-void

    .line 537
    nop

    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_25
        :pswitch_34
        :pswitch_43
        :pswitch_52
    .end packed-switch
.end method

.method dispatchFirstPassAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;I)V
    .registers 5
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .param p2, "offsetStart"    # I

    .prologue
    .line 308
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchFirstPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 309
    iget v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v0, :pswitch_data_22

    .line 317
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "only remove and update ops can be dispatched in first pass"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 311
    :pswitch_12
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, p2, v1}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForRemovingInvisible(II)V

    .line 320
    :goto_19
    return-void

    .line 314
    :pswitch_1a
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, p2, v1}, Landroid/support/v7/widget/AdapterHelper$Callback;->markViewHoldersUpdated(II)V

    goto :goto_19

    .line 309
    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_12
        :pswitch_1a
    .end packed-switch
.end method

.method findPositionOffset(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 457
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/widget/AdapterHelper;->findPositionOffset(II)I

    move-result v0

    return v0
.end method

.method findPositionOffset(II)I
    .registers 8
    .param p1, "position"    # I
    .param p2, "firstPostponedItem"    # I

    .prologue
    .line 461
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 462
    .local v0, "count":I
    move v1, p2

    .local v1, "i":I
    :goto_7
    if-ge v1, v0, :cond_3d

    .line 463
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 464
    .local v2, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_2c

    .line 465
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ne v3, p1, :cond_1f

    .line 466
    iget p1, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    .line 462
    :cond_1c
    :goto_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 468
    :cond_1f
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ge v3, p1, :cond_25

    .line 469
    add-int/lit8 p1, p1, -0x1

    .line 471
    :cond_25
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-gt v3, p1, :cond_1c

    .line 472
    add-int/lit8 p1, p1, 0x1

    goto :goto_1c

    .line 475
    :cond_2c
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v3, p1, :cond_1c

    .line 476
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_42

    .line 477
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v3, v4

    if-ge p1, v3, :cond_3e

    .line 478
    const/4 p1, -0x1

    .line 486
    .end local v2    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .end local p1    # "position":I
    :cond_3d
    return p1

    .line 480
    .restart local v2    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .restart local p1    # "position":I
    :cond_3e
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr p1, v3

    goto :goto_1c

    .line 481
    :cond_42
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-nez v3, :cond_1c

    .line 482
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr p1, v3

    goto :goto_1c
.end method

.method hasPendingUpdates()Z
    .registers 2

    .prologue
    .line 453
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public obtainUpdateOp(III)Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .registers 6
    .param p1, "cmd"    # I
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 686
    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper;->mUpdateOpPool:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v1}, Landroid/support/v4/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 687
    .local v0, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    if-nez v0, :cond_10

    .line 688
    new-instance v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .end local v0    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-direct {v0, p1, p2, p3}, Landroid/support/v7/widget/AdapterHelper$UpdateOp;-><init>(III)V

    .line 694
    .restart local v0    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :goto_f
    return-object v0

    .line 690
    :cond_10
    iput p1, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    .line 691
    iput p2, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 692
    iput p3, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_f
.end method

.method onItemRangeRemoved(II)Z
    .registers 6
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    const/4 v0, 0x1

    .line 509
    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(III)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 510
    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v1, v0, :cond_13

    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method preProcess()V
    .registers 6

    .prologue
    .line 91
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOpReorderer:Landroid/support/v7/widget/OpReorderer;

    iget-object v4, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/OpReorderer;->reorderOps(Ljava/util/List;)V

    .line 92
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 93
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    if-ge v1, v0, :cond_39

    .line 94
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 95
    .local v2, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v3, :pswitch_data_40

    .line 109
    :goto_1d
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOnItemProcessedCallback:Ljava/lang/Runnable;

    if-eqz v3, :cond_26

    .line 110
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOnItemProcessedCallback:Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 93
    :cond_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 97
    :pswitch_29
    invoke-direct {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->applyAdd(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_1d

    .line 100
    :pswitch_2d
    invoke-direct {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->applyRemove(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_1d

    .line 103
    :pswitch_31
    invoke-direct {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->applyUpdate(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_1d

    .line 106
    :pswitch_35
    invoke-direct {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->applyMove(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_1d

    .line 113
    .end local v2    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_39
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 114
    return-void

    .line 95
    nop

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_29
        :pswitch_2d
        :pswitch_31
        :pswitch_35
    .end packed-switch
.end method

.method public recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 3
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    .line 699
    iget-boolean v0, p0, Landroid/support/v7/widget/AdapterHelper;->mDisableRecycler:Z

    if-nez v0, :cond_9

    .line 700
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mUpdateOpPool:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0, p1}, Landroid/support/v4/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    .line 702
    :cond_9
    return-void
.end method

.method recycleUpdateOpsAndClearList(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 705
    .local p1, "ops":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/AdapterHelper$UpdateOp;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 706
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-ge v1, v0, :cond_13

    .line 707
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 706
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 709
    :cond_13
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 710
    return-void
.end method

.method reset()V
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOpsAndClearList(Ljava/util/List;)V

    .line 87
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOpsAndClearList(Ljava/util/List;)V

    .line 88
    return-void
.end method
