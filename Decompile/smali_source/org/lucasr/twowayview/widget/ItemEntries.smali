.class Lorg/lucasr/twowayview/widget/ItemEntries;
.super Ljava/lang/Object;
.source "ItemEntries.java"


# instance fields
.field private mAdapterSize:I

.field private mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

.field private mRestoringItem:Z


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private ensureSize(I)V
    .registers 7
    .param p1, "position"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 53
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    if-nez v1, :cond_18

    .line 54
    const/16 v1, 0xa

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    new-array v1, v1, [Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    iput-object v1, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    .line 55
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    invoke-static {v1, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 62
    :cond_17
    :goto_17
    return-void

    .line 56
    :cond_18
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v1, v1

    if-lt p1, v1, :cond_17

    .line 57
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    .line 58
    .local v0, "oldItemEntries":[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/ItemEntries;->sizeForPosition(I)I

    move-result v1

    new-array v1, v1, [Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    iput-object v1, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    .line 59
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v2, v0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 60
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v2, v0

    iget-object v3, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v3, v3

    invoke-static {v1, v2, v3, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    goto :goto_17
.end method

.method private sizeForPosition(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 38
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v0, v1

    .line 39
    .local v0, "len":I
    :goto_3
    if-gt v0, p1, :cond_8

    .line 40
    mul-int/lit8 v0, v0, 0x2

    goto :goto_3

    .line 45
    :cond_8
    iget-boolean v1, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mRestoringItem:Z

    if-nez v1, :cond_12

    iget v1, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mAdapterSize:I

    if-le v0, v1, :cond_12

    .line 46
    iget v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mAdapterSize:I

    .line 49
    :cond_12
    return v0
.end method


# virtual methods
.method public clear()V
    .registers 3

    .prologue
    .line 105
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    if-eqz v0, :cond_a

    .line 106
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 108
    :cond_a
    return-void
.end method

.method public getItemEntry(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 65
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v0, v0

    if-lt p1, v0, :cond_b

    .line 66
    :cond_9
    const/4 v0, 0x0

    .line 69
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    aget-object v0, v0, p1

    goto :goto_a
.end method

.method public invalidateItemLanesAfter(I)V
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 92
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    if-eqz v2, :cond_9

    iget-object v2, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v2, v2

    if-lt p1, v2, :cond_a

    .line 102
    :cond_9
    return-void

    .line 96
    :cond_a
    move v1, p1

    .local v1, "i":I
    :goto_b
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v2, v2

    if-ge v1, v2, :cond_9

    .line 97
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    aget-object v0, v2, v1

    .line 98
    .local v0, "entry":Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    if-eqz v0, :cond_19

    .line 99
    invoke-virtual {v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->invalidateLane()V

    .line 96
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_b
.end method

.method offsetForAddition(II)V
    .registers 7
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 123
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v0, v0

    if-lt p1, v0, :cond_a

    .line 132
    :cond_9
    :goto_9
    return-void

    .line 127
    :cond_a
    add-int v0, p1, p2

    invoke-direct {p0, v0}, Lorg/lucasr/twowayview/widget/ItemEntries;->ensureSize(I)V

    .line 129
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    iget-object v1, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    add-int v2, p1, p2

    iget-object v3, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v3, v3

    sub-int/2addr v3, p1

    sub-int/2addr v3, p2

    invoke-static {v0, p1, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 131
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    add-int v1, p1, p2

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    goto :goto_9
.end method

.method offsetForRemoval(II)V
    .registers 7
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 111
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v0, v0

    if-lt p1, v0, :cond_a

    .line 120
    :cond_9
    :goto_9
    return-void

    .line 115
    :cond_a
    add-int v0, p1, p2

    invoke-direct {p0, v0}, Lorg/lucasr/twowayview/widget/ItemEntries;->ensureSize(I)V

    .line 117
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    add-int v1, p1, p2

    iget-object v2, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    iget-object v3, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v3, v3

    sub-int/2addr v3, p1

    sub-int/2addr v3, p2

    invoke-static {v0, v1, v2, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 119
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    iget-object v1, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v1, v1

    sub-int/2addr v1, p2

    iget-object v2, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v2, v2

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    goto :goto_9
.end method

.method public putItemEntry(ILorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "entry"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/ItemEntries;->ensureSize(I)V

    .line 74
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    aput-object p2, v0, p1

    .line 75
    return-void
.end method

.method public restoreItemEntry(ILorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "entry"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    .prologue
    .line 78
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mRestoringItem:Z

    .line 79
    invoke-virtual {p0, p1, p2}, Lorg/lucasr/twowayview/widget/ItemEntries;->putItemEntry(ILorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;)V

    .line 80
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mRestoringItem:Z

    .line 81
    return-void
.end method

.method public setAdapterSize(I)V
    .registers 2
    .param p1, "adapterSize"    # I

    .prologue
    .line 88
    iput p1, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mAdapterSize:I

    .line 89
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lorg/lucasr/twowayview/widget/ItemEntries;->mItemEntries:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    array-length v0, v0

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
