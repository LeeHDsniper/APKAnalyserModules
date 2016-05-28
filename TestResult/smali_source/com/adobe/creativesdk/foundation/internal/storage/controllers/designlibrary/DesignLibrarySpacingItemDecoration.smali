.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "DesignLibrarySpacingItemDecoration.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration$MultiColumnDelegate;
    }
.end annotation


# instance fields
.field _horizontalSpacing:I

.field private _isFixedColumn:Z

.field private _multiColumnDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration$MultiColumnDelegate;

.field private _numFixedColumnsCount:I

.field _verticalSpacing:I


# direct methods
.method public constructor <init>(II)V
    .registers 7
    .param p1, "verticalSpacing"    # I
    .param p2, "horizontalSpacing"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 17
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 12
    iput-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->_isFixedColumn:Z

    .line 13
    iput v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->_numFixedColumnsCount:I

    .line 18
    and-int/lit8 v3, p1, 0x1

    if-nez v3, :cond_20

    move v0, v1

    .line 19
    .local v0, "isEven":Z
    :goto_e
    if-nez v0, :cond_12

    .line 20
    add-int/lit8 p1, p1, 0x1

    .line 22
    :cond_12
    and-int/lit8 v3, p2, 0x1

    if-nez v3, :cond_22

    move v0, v1

    .line 23
    :goto_17
    if-nez v0, :cond_1b

    .line 24
    add-int/lit8 p2, p2, 0x1

    .line 27
    :cond_1b
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->_verticalSpacing:I

    .line 28
    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->_horizontalSpacing:I

    .line 29
    return-void

    .end local v0    # "isEven":Z
    :cond_20
    move v0, v2

    .line 18
    goto :goto_e

    .restart local v0    # "isEven":Z
    :cond_22
    move v0, v2

    .line 22
    goto :goto_17
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 8
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 76
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildPosition(Landroid/view/View;)I

    move-result v1

    .line 86
    .local v1, "itemPosition":I
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->_verticalSpacing:I

    div-int/lit8 v2, v2, 0x2

    iput v2, p1, Landroid/graphics/Rect;->left:I

    iput v2, p1, Landroid/graphics/Rect;->right:I

    .line 87
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->_horizontalSpacing:I

    div-int/lit8 v2, v2, 0x2

    iput v2, p1, Landroid/graphics/Rect;->bottom:I

    iput v2, p1, Landroid/graphics/Rect;->top:I

    .line 89
    const/4 v0, 0x0

    .line 90
    .local v0, "bReserveVerticalSpacing":Z
    iget-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->_isFixedColumn:Z

    if-eqz v2, :cond_1e

    .line 91
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->_numFixedColumnsCount:I

    if-ge v1, v2, :cond_27

    const/4 v0, 0x1

    .line 93
    :cond_1e
    :goto_1e
    if-eqz v1, :cond_22

    if-eqz v0, :cond_26

    .line 94
    :cond_22
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->_verticalSpacing:I

    iput v2, p1, Landroid/graphics/Rect;->top:I

    .line 97
    :cond_26
    return-void

    .line 91
    :cond_27
    const/4 v0, 0x0

    goto :goto_1e
.end method

.method public setFixedColumn(I)V
    .registers 3
    .param p1, "numColumns"    # I

    .prologue
    .line 32
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->_isFixedColumn:Z

    .line 33
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->_numFixedColumnsCount:I

    .line 34
    return-void
.end method

.method public setMultiColumnDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration$MultiColumnDelegate;)V
    .registers 3
    .param p1, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration$MultiColumnDelegate;

    .prologue
    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->_isFixedColumn:Z

    .line 38
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->_multiColumnDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration$MultiColumnDelegate;

    .line 39
    return-void
.end method
