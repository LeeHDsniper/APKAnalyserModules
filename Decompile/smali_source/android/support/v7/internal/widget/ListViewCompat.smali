.class public Landroid/support/v7/internal/widget/ListViewCompat;
.super Landroid/widget/ListView;
.source "ListViewCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/internal/widget/ListViewCompat$GateKeeperDrawable;
    }
.end annotation


# static fields
.field private static final STATE_SET_NOTHING:[I


# instance fields
.field private mIsChildViewEnabled:Ljava/lang/reflect/Field;

.field mSelectionBottomPadding:I

.field mSelectionLeftPadding:I

.field mSelectionRightPadding:I

.field mSelectionTopPadding:I

.field private mSelector:Landroid/support/v7/internal/widget/ListViewCompat$GateKeeperDrawable;

.field final mSelectorRect:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 45
    const/4 v0, 0x1

    new-array v0, v0, [I

    aput v1, v0, v1

    sput-object v0, Landroid/support/v7/internal/widget/ListViewCompat;->STATE_SET_NOTHING:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v2, 0x0

    .line 66
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectorRect:Landroid/graphics/Rect;

    .line 48
    iput v2, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectionLeftPadding:I

    .line 49
    iput v2, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectionTopPadding:I

    .line 50
    iput v2, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectionRightPadding:I

    .line 51
    iput v2, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectionBottomPadding:I

    .line 69
    :try_start_13
    const-class v1, Landroid/widget/AbsListView;

    const-string v2, "mIsChildViewEnabled"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mIsChildViewEnabled:Ljava/lang/reflect/Field;

    .line 70
    iget-object v1, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mIsChildViewEnabled:Ljava/lang/reflect/Field;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_23
    .catch Ljava/lang/NoSuchFieldException; {:try_start_13 .. :try_end_23} :catch_24

    .line 74
    :goto_23
    return-void

    .line 71
    :catch_24
    move-exception v0

    .line 72
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    invoke-virtual {v0}, Ljava/lang/NoSuchFieldException;->printStackTrace()V

    goto :goto_23
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 102
    const/4 v0, 0x0

    .line 104
    .local v0, "drawSelectorOnTop":Z
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/widget/ListViewCompat;->drawSelectorCompat(Landroid/graphics/Canvas;)V

    .line 107
    invoke-super {p0, p1}, Landroid/widget/ListView;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 108
    return-void
.end method

.method protected drawSelectorCompat(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 126
    iget-object v1, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectorRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_16

    .line 127
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ListViewCompat;->getSelector()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 128
    .local v0, "selector":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_16

    .line 129
    iget-object v1, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectorRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 130
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 133
    .end local v0    # "selector":Landroid/graphics/drawable/Drawable;
    :cond_16
    return-void
.end method

.method protected drawableStateChanged()V
    .registers 2

    .prologue
    .line 94
    invoke-super {p0}, Landroid/widget/ListView;->drawableStateChanged()V

    .line 96
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ListViewCompat;->setSelectorEnabled(Z)V

    .line 97
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ListViewCompat;->updateSelectorStateCompat()V

    .line 98
    return-void
.end method

.method public measureHeightOfChildrenCompat(IIIII)I
    .registers 27
    .param p1, "widthMeasureSpec"    # I
    .param p2, "startPosition"    # I
    .param p3, "endPosition"    # I
    .param p4, "maxHeight"    # I
    .param p5, "disallowPartialChildPosition"    # I

    .prologue
    .line 259
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/internal/widget/ListViewCompat;->getListPaddingTop()I

    move-result v14

    .line 260
    .local v14, "paddingTop":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/internal/widget/ListViewCompat;->getListPaddingBottom()I

    move-result v11

    .line 261
    .local v11, "paddingBottom":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/internal/widget/ListViewCompat;->getListPaddingLeft()I

    move-result v12

    .line 262
    .local v12, "paddingLeft":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/internal/widget/ListViewCompat;->getListPaddingRight()I

    move-result v13

    .line 263
    .local v13, "paddingRight":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/internal/widget/ListViewCompat;->getDividerHeight()I

    move-result v16

    .line 264
    .local v16, "reportedDividerHeight":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/internal/widget/ListViewCompat;->getDivider()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 266
    .local v6, "divider":Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/internal/widget/ListViewCompat;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    .line 268
    .local v2, "adapter":Landroid/widget/ListAdapter;
    if-nez v2, :cond_21

    .line 269
    add-int v15, v14, v11

    .line 328
    :cond_20
    :goto_20
    return v15

    .line 273
    :cond_21
    add-int v17, v14, v11

    .line 274
    .local v17, "returnedHeight":I
    if-lez v16, :cond_81

    if-eqz v6, :cond_81

    move/from16 v7, v16

    .line 279
    .local v7, "dividerHeight":I
    :goto_29
    const/4 v15, 0x0

    .line 281
    .local v15, "prevHeightWithoutPartialChild":I
    const/4 v3, 0x0

    .line 282
    .local v3, "child":Landroid/view/View;
    const/16 v18, 0x0

    .line 283
    .local v18, "viewType":I
    invoke-interface {v2}, Landroid/widget/ListAdapter;->getCount()I

    move-result v5

    .line 284
    .local v5, "count":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_32
    if-ge v9, v5, :cond_97

    .line 285
    invoke-interface {v2, v9}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v10

    .line 286
    .local v10, "newType":I
    move/from16 v0, v18

    if-eq v10, v0, :cond_3f

    .line 287
    const/4 v3, 0x0

    .line 288
    move/from16 v18, v10

    .line 290
    :cond_3f
    move-object/from16 v0, p0

    invoke-interface {v2, v9, v3, v0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 294
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    .line 295
    .local v4, "childLp":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v4, :cond_83

    iget v0, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v19, v0

    if-lez v19, :cond_83

    .line 296
    iget v0, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v19, v0

    const/high16 v20, 0x40000000

    invoke-static/range {v19 .. v20}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    .line 301
    .local v8, "heightMeasureSpec":I
    :goto_5b
    move/from16 v0, p1

    invoke-virtual {v3, v0, v8}, Landroid/view/View;->measure(II)V

    .line 303
    if-lez v9, :cond_64

    .line 305
    add-int v17, v17, v7

    .line 308
    :cond_64
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v19

    add-int v17, v17, v19

    .line 310
    move/from16 v0, v17

    move/from16 v1, p4

    if-lt v0, v1, :cond_8c

    .line 313
    if-ltz p5, :cond_7e

    move/from16 v0, p5

    if-le v9, v0, :cond_7e

    if-lez v15, :cond_7e

    move/from16 v0, v17

    move/from16 v1, p4

    if-ne v0, v1, :cond_20

    :cond_7e
    move/from16 v15, p4

    goto :goto_20

    .line 274
    .end local v3    # "child":Landroid/view/View;
    .end local v4    # "childLp":Landroid/view/ViewGroup$LayoutParams;
    .end local v5    # "count":I
    .end local v7    # "dividerHeight":I
    .end local v8    # "heightMeasureSpec":I
    .end local v9    # "i":I
    .end local v10    # "newType":I
    .end local v15    # "prevHeightWithoutPartialChild":I
    .end local v18    # "viewType":I
    :cond_81
    const/4 v7, 0x0

    goto :goto_29

    .line 299
    .restart local v3    # "child":Landroid/view/View;
    .restart local v4    # "childLp":Landroid/view/ViewGroup$LayoutParams;
    .restart local v5    # "count":I
    .restart local v7    # "dividerHeight":I
    .restart local v9    # "i":I
    .restart local v10    # "newType":I
    .restart local v15    # "prevHeightWithoutPartialChild":I
    .restart local v18    # "viewType":I
    :cond_83
    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-static/range {v19 .. v20}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    .restart local v8    # "heightMeasureSpec":I
    goto :goto_5b

    .line 321
    :cond_8c
    if-ltz p5, :cond_94

    move/from16 v0, p5

    if-lt v9, v0, :cond_94

    .line 322
    move/from16 v15, v17

    .line 284
    :cond_94
    add-int/lit8 v9, v9, 0x1

    goto :goto_32

    .end local v4    # "childLp":Landroid/view/ViewGroup$LayoutParams;
    .end local v8    # "heightMeasureSpec":I
    .end local v10    # "newType":I
    :cond_97
    move/from16 v15, v17

    .line 328
    goto :goto_20
.end method

.method protected positionSelectorCompat(ILandroid/view/View;)V
    .registers 10
    .param p1, "position"    # I
    .param p2, "sel"    # Landroid/view/View;

    .prologue
    .line 205
    iget-object v2, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectorRect:Landroid/graphics/Rect;

    .line 206
    .local v2, "selectorRect":Landroid/graphics/Rect;
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v4

    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result v5

    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 209
    iget v3, v2, Landroid/graphics/Rect;->left:I

    iget v4, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectionLeftPadding:I

    sub-int/2addr v3, v4

    iput v3, v2, Landroid/graphics/Rect;->left:I

    .line 210
    iget v3, v2, Landroid/graphics/Rect;->top:I

    iget v4, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectionTopPadding:I

    sub-int/2addr v3, v4

    iput v3, v2, Landroid/graphics/Rect;->top:I

    .line 211
    iget v3, v2, Landroid/graphics/Rect;->right:I

    iget v4, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectionRightPadding:I

    add-int/2addr v3, v4

    iput v3, v2, Landroid/graphics/Rect;->right:I

    .line 212
    iget v3, v2, Landroid/graphics/Rect;->bottom:I

    iget v4, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectionBottomPadding:I

    add-int/2addr v3, v4

    iput v3, v2, Landroid/graphics/Rect;->bottom:I

    .line 217
    :try_start_31
    iget-object v3, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mIsChildViewEnabled:Ljava/lang/reflect/Field;

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    .line 218
    .local v1, "isChildViewEnabled":Z
    invoke-virtual {p2}, Landroid/view/View;->isEnabled()Z

    move-result v3

    if-eq v3, v1, :cond_4f

    .line 219
    iget-object v4, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mIsChildViewEnabled:Ljava/lang/reflect/Field;

    if-nez v1, :cond_50

    const/4 v3, 0x1

    :goto_42
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v4, p0, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 220
    const/4 v3, -0x1

    if-eq p1, v3, :cond_4f

    .line 221
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ListViewCompat;->refreshDrawableState()V
    :try_end_4f
    .catch Ljava/lang/IllegalAccessException; {:try_start_31 .. :try_end_4f} :catch_52

    .line 227
    .end local v1    # "isChildViewEnabled":Z
    :cond_4f
    :goto_4f
    return-void

    .line 219
    .restart local v1    # "isChildViewEnabled":Z
    :cond_50
    const/4 v3, 0x0

    goto :goto_42

    .line 224
    .end local v1    # "isChildViewEnabled":Z
    :catch_52
    move-exception v0

    .line 225
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_4f
.end method

.method protected positionSelectorLikeFocusCompat(ILandroid/view/View;)V
    .registers 11
    .param p1, "position"    # I
    .param p2, "sel"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 187
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ListViewCompat;->getSelector()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 188
    .local v2, "selector":Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_2d

    const/4 v7, -0x1

    if-eq p1, v7, :cond_2d

    move v1, v5

    .line 189
    .local v1, "manageState":Z
    :goto_c
    if-eqz v1, :cond_11

    .line 190
    invoke-virtual {v2, v6, v6}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 193
    :cond_11
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/internal/widget/ListViewCompat;->positionSelectorCompat(ILandroid/view/View;)V

    .line 195
    if-eqz v1, :cond_2c

    .line 196
    iget-object v0, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectorRect:Landroid/graphics/Rect;

    .line 197
    .local v0, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v3

    .line 198
    .local v3, "x":F
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v4

    .line 199
    .local v4, "y":F
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ListViewCompat;->getVisibility()I

    move-result v7

    if-nez v7, :cond_2f

    :goto_26
    invoke-virtual {v2, v5, v6}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 200
    invoke-static {v2, v3, v4}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setHotspot(Landroid/graphics/drawable/Drawable;FF)V

    .line 202
    .end local v0    # "bounds":Landroid/graphics/Rect;
    .end local v3    # "x":F
    .end local v4    # "y":F
    :cond_2c
    return-void

    .end local v1    # "manageState":Z
    :cond_2d
    move v1, v6

    .line 188
    goto :goto_c

    .restart local v0    # "bounds":Landroid/graphics/Rect;
    .restart local v1    # "manageState":Z
    .restart local v3    # "x":F
    .restart local v4    # "y":F
    :cond_2f
    move v5, v6

    .line 199
    goto :goto_26
.end method

.method protected positionSelectorLikeTouchCompat(ILandroid/view/View;FF)V
    .registers 7
    .param p1, "position"    # I
    .param p2, "sel"    # Landroid/view/View;
    .param p3, "x"    # F
    .param p4, "y"    # F

    .prologue
    .line 176
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/internal/widget/ListViewCompat;->positionSelectorLikeFocusCompat(ILandroid/view/View;)V

    .line 178
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ListViewCompat;->getSelector()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 179
    .local v0, "selector":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_f

    const/4 v1, -0x1

    if-eq p1, v1, :cond_f

    .line 180
    invoke-static {v0, p3, p4}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setHotspot(Landroid/graphics/drawable/Drawable;FF)V

    .line 182
    :cond_f
    return-void
.end method

.method public setSelector(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "sel"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 78
    if-eqz p1, :cond_29

    new-instance v1, Landroid/support/v7/internal/widget/ListViewCompat$GateKeeperDrawable;

    invoke-direct {v1, p1}, Landroid/support/v7/internal/widget/ListViewCompat$GateKeeperDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    :goto_7
    iput-object v1, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelector:Landroid/support/v7/internal/widget/ListViewCompat$GateKeeperDrawable;

    .line 79
    iget-object v1, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelector:Landroid/support/v7/internal/widget/ListViewCompat$GateKeeperDrawable;

    invoke-super {p0, v1}, Landroid/widget/ListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 81
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 82
    .local v0, "padding":Landroid/graphics/Rect;
    if-eqz p1, :cond_18

    .line 83
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 86
    :cond_18
    iget v1, v0, Landroid/graphics/Rect;->left:I

    iput v1, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectionLeftPadding:I

    .line 87
    iget v1, v0, Landroid/graphics/Rect;->top:I

    iput v1, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectionTopPadding:I

    .line 88
    iget v1, v0, Landroid/graphics/Rect;->right:I

    iput v1, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectionRightPadding:I

    .line 89
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    iput v1, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelectionBottomPadding:I

    .line 90
    return-void

    .line 78
    .end local v0    # "padding":Landroid/graphics/Rect;
    :cond_29
    const/4 v1, 0x0

    goto :goto_7
.end method

.method protected setSelectorEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 332
    iget-object v0, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelector:Landroid/support/v7/internal/widget/ListViewCompat$GateKeeperDrawable;

    if-eqz v0, :cond_9

    .line 333
    iget-object v0, p0, Landroid/support/v7/internal/widget/ListViewCompat;->mSelector:Landroid/support/v7/internal/widget/ListViewCompat$GateKeeperDrawable;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/ListViewCompat$GateKeeperDrawable;->setEnabled(Z)V

    .line 335
    :cond_9
    return-void
.end method

.method protected shouldShowSelectorCompat()Z
    .registers 2

    .prologue
    .line 118
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ListViewCompat;->touchModeDrawsInPressedStateCompat()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ListViewCompat;->isPressed()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected touchModeDrawsInPressedStateCompat()Z
    .registers 2

    .prologue
    .line 122
    const/4 v0, 0x0

    return v0
.end method

.method protected updateSelectorStateCompat()V
    .registers 3

    .prologue
    .line 111
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ListViewCompat;->getSelector()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 112
    .local v0, "selector":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_13

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ListViewCompat;->shouldShowSelectorCompat()Z

    move-result v1

    if-eqz v1, :cond_13

    .line 113
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ListViewCompat;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 115
    :cond_13
    return-void
.end method
