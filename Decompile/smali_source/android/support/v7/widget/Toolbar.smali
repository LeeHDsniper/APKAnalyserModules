.class public Landroid/support/v7/widget/Toolbar;
.super Landroid/view/ViewGroup;
.source "Toolbar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;,
        Landroid/support/v7/widget/Toolbar$SavedState;,
        Landroid/support/v7/widget/Toolbar$LayoutParams;,
        Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;
    }
.end annotation


# instance fields
.field private mActionMenuPresenterCallback:Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

.field private mButtonGravity:I

.field private mCollapseButtonView:Landroid/widget/ImageButton;

.field private mCollapseDescription:Ljava/lang/CharSequence;

.field private mCollapseIcon:Landroid/graphics/drawable/Drawable;

.field private mCollapsible:Z

.field private final mContentInsets:Landroid/support/v7/internal/widget/RtlSpacingHelper;

.field private mEatingHover:Z

.field private mEatingTouch:Z

.field mExpandedActionView:Landroid/view/View;

.field private mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

.field private mGravity:I

.field private mLogoView:Landroid/widget/ImageView;

.field private mMaxButtonHeight:I

.field private mMenuBuilderCallback:Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;

.field private mMenuView:Landroid/support/v7/widget/ActionMenuView;

.field private final mMenuViewItemClickListener:Landroid/support/v7/widget/ActionMenuView$OnMenuItemClickListener;

.field private mNavButtonView:Landroid/widget/ImageButton;

.field private mOnMenuItemClickListener:Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;

.field private mOuterActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

.field private mPopupContext:Landroid/content/Context;

.field private mPopupTheme:I

.field private final mShowOverflowMenuRunnable:Ljava/lang/Runnable;

.field private mSubtitleText:Ljava/lang/CharSequence;

.field private mSubtitleTextAppearance:I

.field private mSubtitleTextColor:I

.field private mSubtitleTextView:Landroid/widget/TextView;

.field private final mTempMargins:[I

.field private final mTempViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mTintManager:Landroid/support/v7/internal/widget/TintManager;

.field private mTitleMarginBottom:I

.field private mTitleMarginEnd:I

.field private mTitleMarginStart:I

.field private mTitleMarginTop:I

.field private mTitleText:Ljava/lang/CharSequence;

.field private mTitleTextAppearance:I

.field private mTitleTextColor:I

.field private mTitleTextView:Landroid/widget/TextView;

.field private mWrapper:Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 187
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/Toolbar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 188
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 191
    sget v0, Landroid/support/v7/appcompat/R$attr;->toolbarStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/Toolbar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 192
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 25
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 195
    invoke-direct/range {p0 .. p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 139
    new-instance v18, Landroid/support/v7/internal/widget/RtlSpacingHelper;

    invoke-direct/range {v18 .. v18}, Landroid/support/v7/internal/widget/RtlSpacingHelper;-><init>()V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/widget/Toolbar;->mContentInsets:Landroid/support/v7/internal/widget/RtlSpacingHelper;

    .line 141
    const v18, 0x800013

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/Toolbar;->mGravity:I

    .line 153
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/widget/Toolbar;->mTempViews:Ljava/util/ArrayList;

    .line 155
    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [I

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/widget/Toolbar;->mTempMargins:[I

    .line 159
    new-instance v18, Landroid/support/v7/widget/Toolbar$1;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/support/v7/widget/Toolbar$1;-><init>(Landroid/support/v7/widget/Toolbar;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/widget/Toolbar;->mMenuViewItemClickListener:Landroid/support/v7/widget/ActionMenuView$OnMenuItemClickListener;

    .line 178
    new-instance v18, Landroid/support/v7/widget/Toolbar$2;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/support/v7/widget/Toolbar$2;-><init>(Landroid/support/v7/widget/Toolbar;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/widget/Toolbar;->mShowOverflowMenuRunnable:Ljava/lang/Runnable;

    .line 198
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v18

    sget-object v19, Landroid/support/v7/appcompat/R$styleable;->Toolbar:[I

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move-object/from16 v2, v19

    move/from16 v3, p3

    move/from16 v4, v20

    invoke-static {v0, v1, v2, v3, v4}, Landroid/support/v7/internal/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/internal/widget/TintTypedArray;

    move-result-object v5

    .line 201
    .local v5, "a":Landroid/support/v7/internal/widget/TintTypedArray;
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_titleTextAppearance:I

    const/16 v19, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getResourceId(II)I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/Toolbar;->mTitleTextAppearance:I

    .line 202
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_subtitleTextAppearance:I

    const/16 v19, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getResourceId(II)I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/Toolbar;->mSubtitleTextAppearance:I

    .line 203
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_android_gravity:I

    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mGravity:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getInteger(II)I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/Toolbar;->mGravity:I

    .line 204
    const/16 v18, 0x30

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/Toolbar;->mButtonGravity:I

    .line 205
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_titleMargins:I

    const/16 v19, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getDimensionPixelOffset(II)I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/Toolbar;->mTitleMarginBottom:I

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/Toolbar;->mTitleMarginTop:I

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/Toolbar;->mTitleMarginEnd:I

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/Toolbar;->mTitleMarginStart:I

    .line 208
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_titleMarginStart:I

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getDimensionPixelOffset(II)I

    move-result v12

    .line 209
    .local v12, "marginStart":I
    if-ltz v12, :cond_dc

    .line 210
    move-object/from16 v0, p0

    iput v12, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginStart:I

    .line 213
    :cond_dc
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_titleMarginEnd:I

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getDimensionPixelOffset(II)I

    move-result v11

    .line 214
    .local v11, "marginEnd":I
    if-ltz v11, :cond_ee

    .line 215
    move-object/from16 v0, p0

    iput v11, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginEnd:I

    .line 218
    :cond_ee
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_titleMarginTop:I

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getDimensionPixelOffset(II)I

    move-result v13

    .line 219
    .local v13, "marginTop":I
    if-ltz v13, :cond_100

    .line 220
    move-object/from16 v0, p0

    iput v13, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginTop:I

    .line 223
    :cond_100
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_titleMarginBottom:I

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getDimensionPixelOffset(II)I

    move-result v10

    .line 225
    .local v10, "marginBottom":I
    if-ltz v10, :cond_112

    .line 226
    move-object/from16 v0, p0

    iput v10, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginBottom:I

    .line 229
    :cond_112
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_maxButtonHeight:I

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/Toolbar;->mMaxButtonHeight:I

    .line 231
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_contentInsetStart:I

    const/high16 v19, -0x80000000

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getDimensionPixelOffset(II)I

    move-result v9

    .line 234
    .local v9, "contentInsetStart":I
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_contentInsetEnd:I

    const/high16 v19, -0x80000000

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getDimensionPixelOffset(II)I

    move-result v6

    .line 237
    .local v6, "contentInsetEnd":I
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_contentInsetLeft:I

    const/16 v19, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v7

    .line 239
    .local v7, "contentInsetLeft":I
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_contentInsetRight:I

    const/16 v19, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v8

    .line 242
    .local v8, "contentInsetRight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mContentInsets:Landroid/support/v7/internal/widget/RtlSpacingHelper;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v7, v8}, Landroid/support/v7/internal/widget/RtlSpacingHelper;->setAbsolute(II)V

    .line 244
    const/high16 v18, -0x80000000

    move/from16 v0, v18

    if-ne v9, v0, :cond_16b

    const/high16 v18, -0x80000000

    move/from16 v0, v18

    if-eq v6, v0, :cond_176

    .line 246
    :cond_16b
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mContentInsets:Landroid/support/v7/internal/widget/RtlSpacingHelper;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9, v6}, Landroid/support/v7/internal/widget/RtlSpacingHelper;->setRelative(II)V

    .line 249
    :cond_176
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_collapseIcon:I

    move/from16 v0, v18

    invoke-virtual {v5, v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/widget/Toolbar;->mCollapseIcon:Landroid/graphics/drawable/Drawable;

    .line 250
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_collapseContentDescription:I

    move/from16 v0, v18

    invoke-virtual {v5, v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/widget/Toolbar;->mCollapseDescription:Ljava/lang/CharSequence;

    .line 252
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_title:I

    move/from16 v0, v18

    invoke-virtual {v5, v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v17

    .line 253
    .local v17, "title":Ljava/lang/CharSequence;
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_1a7

    .line 254
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 257
    :cond_1a7
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_subtitle:I

    move/from16 v0, v18

    invoke-virtual {v5, v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v16

    .line 258
    .local v16, "subtitle":Ljava/lang/CharSequence;
    invoke-static/range {v16 .. v16}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_1bc

    .line 259
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 262
    :cond_1bc
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/widget/Toolbar;->mPopupContext:Landroid/content/Context;

    .line 263
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_popupTheme:I

    const/16 v19, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getResourceId(II)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setPopupTheme(I)V

    .line 265
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_navigationIcon:I

    move/from16 v0, v18

    invoke-virtual {v5, v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v15

    .line 266
    .local v15, "navIcon":Landroid/graphics/drawable/Drawable;
    if-eqz v15, :cond_1e8

    .line 267
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 269
    :cond_1e8
    sget v18, Landroid/support/v7/appcompat/R$styleable;->Toolbar_navigationContentDescription:I

    move/from16 v0, v18

    invoke-virtual {v5, v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v14

    .line 270
    .local v14, "navDesc":Ljava/lang/CharSequence;
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_1fb

    .line 271
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Landroid/support/v7/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    .line 274
    :cond_1fb
    invoke-virtual {v5}, Landroid/support/v7/internal/widget/TintTypedArray;->recycle()V

    .line 277
    invoke-virtual {v5}, Landroid/support/v7/internal/widget/TintTypedArray;->getTintManager()Landroid/support/v7/internal/widget/TintManager;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/widget/Toolbar;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    .line 278
    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/widget/Toolbar;)Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/Toolbar;

    .prologue
    .line 107
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mOnMenuItemClickListener:Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;

    return-object v0
.end method

.method static synthetic access$200(Landroid/support/v7/widget/Toolbar;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/v7/widget/Toolbar;

    .prologue
    .line 107
    invoke-direct {p0}, Landroid/support/v7/widget/Toolbar;->ensureCollapseButtonView()V

    return-void
.end method

.method static synthetic access$300(Landroid/support/v7/widget/Toolbar;)Landroid/widget/ImageButton;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/Toolbar;

    .prologue
    .line 107
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$400(Landroid/support/v7/widget/Toolbar;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/Toolbar;

    .prologue
    .line 107
    iget v0, p0, Landroid/support/v7/widget/Toolbar;->mButtonGravity:I

    return v0
.end method

.method static synthetic access$500(Landroid/support/v7/widget/Toolbar;Z)V
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/Toolbar;
    .param p1, "x1"    # Z

    .prologue
    .line 107
    invoke-direct {p0, p1}, Landroid/support/v7/widget/Toolbar;->setChildVisibilityForExpandedActionView(Z)V

    return-void
.end method

.method private addCustomViewsWithGravity(Ljava/util/List;I)V
    .registers 10
    .param p2, "gravity"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .local p1, "views":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    const/4 v4, 0x1

    .line 1635
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v6

    if-ne v6, v4, :cond_3e

    .line 1636
    .local v4, "isRtl":Z
    :goto_7
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getChildCount()I

    move-result v2

    .line 1637
    .local v2, "childCount":I
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v6

    invoke-static {p2, v6}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v0

    .line 1640
    .local v0, "absGrav":I
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 1642
    if-eqz v4, :cond_40

    .line 1643
    add-int/lit8 v3, v2, -0x1

    .local v3, "i":I
    :goto_1a
    if-ltz v3, :cond_65

    .line 1644
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/Toolbar;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1645
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1646
    .local v5, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    iget v6, v5, Landroid/support/v7/widget/Toolbar$LayoutParams;->mViewType:I

    if-nez v6, :cond_3b

    invoke-direct {p0, v1}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_3b

    iget v6, v5, Landroid/support/v7/widget/Toolbar$LayoutParams;->gravity:I

    invoke-direct {p0, v6}, Landroid/support/v7/widget/Toolbar;->getChildHorizontalGravity(I)I

    move-result v6

    if-ne v6, v0, :cond_3b

    .line 1648
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1643
    :cond_3b
    add-int/lit8 v3, v3, -0x1

    goto :goto_1a

    .line 1635
    .end local v0    # "absGrav":I
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "childCount":I
    .end local v3    # "i":I
    .end local v4    # "isRtl":Z
    .end local v5    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_3e
    const/4 v4, 0x0

    goto :goto_7

    .line 1652
    .restart local v0    # "absGrav":I
    .restart local v2    # "childCount":I
    .restart local v4    # "isRtl":Z
    :cond_40
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_41
    if-ge v3, v2, :cond_65

    .line 1653
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/Toolbar;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1654
    .restart local v1    # "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1655
    .restart local v5    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    iget v6, v5, Landroid/support/v7/widget/Toolbar$LayoutParams;->mViewType:I

    if-nez v6, :cond_62

    invoke-direct {p0, v1}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_62

    iget v6, v5, Landroid/support/v7/widget/Toolbar$LayoutParams;->gravity:I

    invoke-direct {p0, v6}, Landroid/support/v7/widget/Toolbar;->getChildHorizontalGravity(I)I

    move-result v6

    if-ne v6, v0, :cond_62

    .line 1657
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1652
    :cond_62
    add-int/lit8 v3, v3, 0x1

    goto :goto_41

    .line 1661
    .end local v1    # "child":Landroid/view/View;
    .end local v5    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_65
    return-void
.end method

.method private addSystemView(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1018
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 1020
    .local v1, "vlp":Landroid/view/ViewGroup$LayoutParams;
    if-nez v1, :cond_11

    .line 1021
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->generateDefaultLayoutParams()Landroid/support/v7/widget/Toolbar$LayoutParams;

    move-result-object v0

    .line 1027
    .local v0, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :goto_a
    const/4 v2, 0x1

    iput v2, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->mViewType:I

    .line 1028
    invoke-virtual {p0, p1, v0}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1029
    return-void

    .line 1022
    .end local v0    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_11
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/Toolbar;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v2

    if-nez v2, :cond_1c

    .line 1023
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/Toolbar;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/Toolbar$LayoutParams;

    move-result-object v0

    .restart local v0    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    goto :goto_a

    .end local v0    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_1c
    move-object v0, v1

    .line 1025
    check-cast v0, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .restart local v0    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    goto :goto_a
.end method

.method private ensureCollapseButtonView()V
    .registers 6

    .prologue
    .line 999
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    if-nez v1, :cond_40

    .line 1000
    new-instance v1, Landroid/widget/ImageButton;

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    sget v4, Landroid/support/v7/appcompat/R$attr;->toolbarNavigationButtonStyle:I

    invoke-direct {v1, v2, v3, v4}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v1, p0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    .line 1002
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    iget-object v2, p0, Landroid/support/v7/widget/Toolbar;->mCollapseIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1003
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    iget-object v2, p0, Landroid/support/v7/widget/Toolbar;->mCollapseDescription:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1004
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->generateDefaultLayoutParams()Landroid/support/v7/widget/Toolbar$LayoutParams;

    move-result-object v0

    .line 1005
    .local v0, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    const v1, 0x800003

    iget v2, p0, Landroid/support/v7/widget/Toolbar;->mButtonGravity:I

    and-int/lit8 v2, v2, 0x70

    or-int/2addr v1, v2

    iput v1, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->gravity:I

    .line 1006
    const/4 v1, 0x2

    iput v1, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->mViewType:I

    .line 1007
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1008
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    new-instance v2, Landroid/support/v7/widget/Toolbar$3;

    invoke-direct {v2, p0}, Landroid/support/v7/widget/Toolbar$3;-><init>(Landroid/support/v7/widget/Toolbar;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1015
    .end local v0    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_40
    return-void
.end method

.method private ensureLogoView()V
    .registers 3

    .prologue
    .line 504
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    if-nez v0, :cond_f

    .line 505
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    .line 507
    :cond_f
    return-void
.end method

.method private ensureMenu()V
    .registers 4

    .prologue
    .line 819
    invoke-direct {p0}, Landroid/support/v7/widget/Toolbar;->ensureMenuView()V

    .line 820
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v1}, Landroid/support/v7/widget/ActionMenuView;->peekMenu()Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-result-object v1

    if-nez v1, :cond_2c

    .line 822
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v1}, Landroid/support/v7/widget/ActionMenuView;->getMenu()Landroid/view/Menu;

    move-result-object v0

    check-cast v0, Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 823
    .local v0, "menu":Landroid/support/v7/internal/view/menu/MenuBuilder;
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    if-nez v1, :cond_1f

    .line 824
    new-instance v1, Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;-><init>(Landroid/support/v7/widget/Toolbar;Landroid/support/v7/widget/Toolbar$1;)V

    iput-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    .line 826
    :cond_1f
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/ActionMenuView;->setExpandedActionViewsExclusive(Z)V

    .line 827
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    iget-object v2, p0, Landroid/support/v7/widget/Toolbar;->mPopupContext:Landroid/content/Context;

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->addMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;Landroid/content/Context;)V

    .line 829
    .end local v0    # "menu":Landroid/support/v7/internal/view/menu/MenuBuilder;
    :cond_2c
    return-void
.end method

.method private ensureMenuView()V
    .registers 5

    .prologue
    .line 832
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-nez v1, :cond_3e

    .line 833
    new-instance v1, Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/support/v7/widget/ActionMenuView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    .line 834
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    iget v2, p0, Landroid/support/v7/widget/Toolbar;->mPopupTheme:I

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/ActionMenuView;->setPopupTheme(I)V

    .line 835
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    iget-object v2, p0, Landroid/support/v7/widget/Toolbar;->mMenuViewItemClickListener:Landroid/support/v7/widget/ActionMenuView$OnMenuItemClickListener;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/ActionMenuView;->setOnMenuItemClickListener(Landroid/support/v7/widget/ActionMenuView$OnMenuItemClickListener;)V

    .line 836
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    iget-object v2, p0, Landroid/support/v7/widget/Toolbar;->mActionMenuPresenterCallback:Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    iget-object v3, p0, Landroid/support/v7/widget/Toolbar;->mMenuBuilderCallback:Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/ActionMenuView;->setMenuCallbacks(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;)V

    .line 837
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->generateDefaultLayoutParams()Landroid/support/v7/widget/Toolbar$LayoutParams;

    move-result-object v0

    .line 838
    .local v0, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    const v1, 0x800005

    iget v2, p0, Landroid/support/v7/widget/Toolbar;->mButtonGravity:I

    and-int/lit8 v2, v2, 0x70

    or-int/2addr v1, v2

    iput v1, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->gravity:I

    .line 839
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/ActionMenuView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 840
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-direct {p0, v1}, Landroid/support/v7/widget/Toolbar;->addSystemView(Landroid/view/View;)V

    .line 842
    .end local v0    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_3e
    return-void
.end method

.method private ensureNavButtonView()V
    .registers 6

    .prologue
    .line 989
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    if-nez v1, :cond_25

    .line 990
    new-instance v1, Landroid/widget/ImageButton;

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    sget v4, Landroid/support/v7/appcompat/R$attr;->toolbarNavigationButtonStyle:I

    invoke-direct {v1, v2, v3, v4}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v1, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    .line 992
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->generateDefaultLayoutParams()Landroid/support/v7/widget/Toolbar$LayoutParams;

    move-result-object v0

    .line 993
    .local v0, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    const v1, 0x800003

    iget v2, p0, Landroid/support/v7/widget/Toolbar;->mButtonGravity:I

    and-int/lit8 v2, v2, 0x70

    or-int/2addr v1, v2

    iput v1, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->gravity:I

    .line 994
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 996
    .end local v0    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_25
    return-void
.end method

.method private getChildHorizontalGravity(I)I
    .registers 6
    .param p1, "gravity"    # I

    .prologue
    .line 1664
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v2

    .line 1665
    .local v2, "ld":I
    invoke-static {p1, v2}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v0

    .line 1666
    .local v0, "absGrav":I
    and-int/lit8 v1, v0, 0x7

    .line 1667
    .local v1, "hGrav":I
    packed-switch v1, :pswitch_data_16

    .line 1673
    :pswitch_d
    const/4 v3, 0x1

    if-ne v2, v3, :cond_13

    const/4 v3, 0x5

    :goto_11
    move v1, v3

    .end local v1    # "hGrav":I
    :pswitch_12
    return v1

    .restart local v1    # "hGrav":I
    :cond_13
    const/4 v3, 0x3

    goto :goto_11

    .line 1667
    nop

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_12
        :pswitch_d
        :pswitch_12
        :pswitch_d
        :pswitch_12
    .end packed-switch
.end method

.method private getChildTop(Landroid/view/View;I)I
    .registers 14
    .param p1, "child"    # Landroid/view/View;
    .param p2, "alignmentHeight"    # I

    .prologue
    const/4 v9, 0x0

    .line 1584
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1585
    .local v3, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 1586
    .local v1, "childHeight":I
    if-lez p2, :cond_37

    sub-int v10, v1, p2

    div-int/lit8 v0, v10, 0x2

    .line 1587
    .local v0, "alignmentOffset":I
    :goto_11
    iget v10, v3, Landroid/support/v7/widget/Toolbar$LayoutParams;->gravity:I

    invoke-direct {p0, v10}, Landroid/support/v7/widget/Toolbar;->getChildVerticalGravity(I)I

    move-result v10

    sparse-switch v10, :sswitch_data_62

    .line 1597
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getPaddingTop()I

    move-result v5

    .line 1598
    .local v5, "paddingTop":I
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getPaddingBottom()I

    move-result v4

    .line 1599
    .local v4, "paddingBottom":I
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getHeight()I

    move-result v2

    .line 1600
    .local v2, "height":I
    sub-int v10, v2, v5

    sub-int v6, v10, v4

    .line 1601
    .local v6, "space":I
    sub-int v10, v6, v1

    div-int/lit8 v7, v10, 0x2

    .line 1602
    .local v7, "spaceAbove":I
    iget v10, v3, Landroid/support/v7/widget/Toolbar$LayoutParams;->topMargin:I

    if-ge v7, v10, :cond_4e

    .line 1603
    iget v7, v3, Landroid/support/v7/widget/Toolbar$LayoutParams;->topMargin:I

    .line 1611
    :cond_34
    :goto_34
    add-int v9, v5, v7

    .end local v2    # "height":I
    .end local v4    # "paddingBottom":I
    .end local v5    # "paddingTop":I
    .end local v6    # "space":I
    .end local v7    # "spaceAbove":I
    :goto_36
    return v9

    .end local v0    # "alignmentOffset":I
    :cond_37
    move v0, v9

    .line 1586
    goto :goto_11

    .line 1589
    .restart local v0    # "alignmentOffset":I
    :sswitch_39
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getPaddingTop()I

    move-result v9

    sub-int/2addr v9, v0

    goto :goto_36

    .line 1592
    :sswitch_3f
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getHeight()I

    move-result v9

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getPaddingBottom()I

    move-result v10

    sub-int/2addr v9, v10

    sub-int/2addr v9, v1

    iget v10, v3, Landroid/support/v7/widget/Toolbar$LayoutParams;->bottomMargin:I

    sub-int/2addr v9, v10

    sub-int/2addr v9, v0

    goto :goto_36

    .line 1605
    .restart local v2    # "height":I
    .restart local v4    # "paddingBottom":I
    .restart local v5    # "paddingTop":I
    .restart local v6    # "space":I
    .restart local v7    # "spaceAbove":I
    :cond_4e
    sub-int v10, v2, v4

    sub-int/2addr v10, v1

    sub-int/2addr v10, v7

    sub-int v8, v10, v5

    .line 1607
    .local v8, "spaceBelow":I
    iget v10, v3, Landroid/support/v7/widget/Toolbar$LayoutParams;->bottomMargin:I

    if-ge v8, v10, :cond_34

    .line 1608
    iget v10, v3, Landroid/support/v7/widget/Toolbar$LayoutParams;->bottomMargin:I

    sub-int/2addr v10, v8

    sub-int v10, v7, v10

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v7

    goto :goto_34

    .line 1587
    :sswitch_data_62
    .sparse-switch
        0x30 -> :sswitch_39
        0x50 -> :sswitch_3f
    .end sparse-switch
.end method

.method private getChildVerticalGravity(I)I
    .registers 4
    .param p1, "gravity"    # I

    .prologue
    .line 1616
    and-int/lit8 v0, p1, 0x70

    .line 1617
    .local v0, "vgrav":I
    sparse-switch v0, :sswitch_data_a

    .line 1623
    iget v1, p0, Landroid/support/v7/widget/Toolbar;->mGravity:I

    and-int/lit8 v0, v1, 0x70

    .end local v0    # "vgrav":I
    :sswitch_9
    return v0

    .line 1617
    :sswitch_data_a
    .sparse-switch
        0x10 -> :sswitch_9
        0x30 -> :sswitch_9
        0x50 -> :sswitch_9
    .end sparse-switch
.end method

.method private getHorizontalMargins(Landroid/view/View;)I
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1682
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 1683
    .local v0, "mlp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-static {v0}, Landroid/support/v4/view/MarginLayoutParamsCompat;->getMarginStart(Landroid/view/ViewGroup$MarginLayoutParams;)I

    move-result v1

    invoke-static {v0}, Landroid/support/v4/view/MarginLayoutParamsCompat;->getMarginEnd(Landroid/view/ViewGroup$MarginLayoutParams;)I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method

.method private getMenuInflater()Landroid/view/MenuInflater;
    .registers 3

    .prologue
    .line 845
    new-instance v0, Landroid/support/v7/internal/view/SupportMenuInflater;

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/internal/view/SupportMenuInflater;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method private getVerticalMargins(Landroid/view/View;)I
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1688
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 1689
    .local v0, "mlp":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v1, v2

    return v1
.end method

.method private getViewListMeasuredWidth(Ljava/util/List;[I)I
    .registers 16
    .param p2, "collapsingMargins"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;[I)I"
        }
    .end annotation

    .prologue
    .local p1, "views":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    const/4 v12, 0x0

    .line 1539
    aget v0, p2, v12

    .line 1540
    .local v0, "collapseLeft":I
    const/4 v11, 0x1

    aget v1, p2, v11

    .line 1541
    .local v1, "collapseRight":I
    const/4 v10, 0x0

    .line 1542
    .local v10, "width":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    .line 1543
    .local v2, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_c
    if-ge v3, v2, :cond_3e

    .line 1544
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    .line 1545
    .local v9, "v":Landroid/view/View;
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1546
    .local v6, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    iget v11, v6, Landroid/support/v7/widget/Toolbar$LayoutParams;->leftMargin:I

    sub-int v4, v11, v0

    .line 1547
    .local v4, "l":I
    iget v11, v6, Landroid/support/v7/widget/Toolbar$LayoutParams;->rightMargin:I

    sub-int v7, v11, v1

    .line 1548
    .local v7, "r":I
    invoke-static {v12, v4}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 1549
    .local v5, "leftMargin":I
    invoke-static {v12, v7}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 1550
    .local v8, "rightMargin":I
    neg-int v11, v4

    invoke-static {v12, v11}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1551
    neg-int v11, v7

    invoke-static {v12, v11}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 1552
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v11

    add-int/2addr v11, v5

    add-int/2addr v11, v8

    add-int/2addr v10, v11

    .line 1543
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 1554
    .end local v4    # "l":I
    .end local v5    # "leftMargin":I
    .end local v6    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    .end local v7    # "r":I
    .end local v8    # "rightMargin":I
    .end local v9    # "v":Landroid/view/View;
    :cond_3e
    return v10
.end method

.method private layoutChildLeft(Landroid/view/View;I[II)I
    .registers 12
    .param p1, "child"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "collapsingMargins"    # [I
    .param p4, "alignmentHeight"    # I

    .prologue
    const/4 v6, 0x0

    .line 1559
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1560
    .local v2, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    iget v4, v2, Landroid/support/v7/widget/Toolbar$LayoutParams;->leftMargin:I

    aget v5, p3, v6

    sub-int v1, v4, v5

    .line 1561
    .local v1, "l":I
    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    move-result v4

    add-int/2addr p2, v4

    .line 1562
    neg-int v4, v1

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    aput v4, p3, v6

    .line 1563
    invoke-direct {p0, p1, p4}, Landroid/support/v7/widget/Toolbar;->getChildTop(Landroid/view/View;I)I

    move-result v3

    .line 1564
    .local v3, "top":I
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    .line 1565
    .local v0, "childWidth":I
    add-int v4, p2, v0

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    add-int/2addr v5, v3

    invoke-virtual {p1, p2, v3, v4, v5}, Landroid/view/View;->layout(IIII)V

    .line 1566
    iget v4, v2, Landroid/support/v7/widget/Toolbar$LayoutParams;->rightMargin:I

    add-int/2addr v4, v0

    add-int/2addr p2, v4

    .line 1567
    return p2
.end method

.method private layoutChildRight(Landroid/view/View;I[II)I
    .registers 13
    .param p1, "child"    # Landroid/view/View;
    .param p2, "right"    # I
    .param p3, "collapsingMargins"    # [I
    .param p4, "alignmentHeight"    # I

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1572
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1573
    .local v1, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    iget v4, v1, Landroid/support/v7/widget/Toolbar$LayoutParams;->rightMargin:I

    aget v5, p3, v7

    sub-int v2, v4, v5

    .line 1574
    .local v2, "r":I
    invoke-static {v6, v2}, Ljava/lang/Math;->max(II)I

    move-result v4

    sub-int/2addr p2, v4

    .line 1575
    neg-int v4, v2

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    aput v4, p3, v7

    .line 1576
    invoke-direct {p0, p1, p4}, Landroid/support/v7/widget/Toolbar;->getChildTop(Landroid/view/View;I)I

    move-result v3

    .line 1577
    .local v3, "top":I
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    .line 1578
    .local v0, "childWidth":I
    sub-int v4, p2, v0

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    add-int/2addr v5, v3

    invoke-virtual {p1, v4, v3, p2, v5}, Landroid/view/View;->layout(IIII)V

    .line 1579
    iget v4, v1, Landroid/support/v7/widget/Toolbar$LayoutParams;->leftMargin:I

    add-int/2addr v4, v0

    sub-int/2addr p2, v4

    .line 1580
    return p2
.end method

.method private measureChildCollapseMargins(Landroid/view/View;IIII[I)I
    .registers 18
    .param p1, "child"    # Landroid/view/View;
    .param p2, "parentWidthMeasureSpec"    # I
    .param p3, "widthUsed"    # I
    .param p4, "parentHeightMeasureSpec"    # I
    .param p5, "heightUsed"    # I
    .param p6, "collapsingMargins"    # [I

    .prologue
    .line 1149
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 1151
    .local v5, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v8, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    const/4 v9, 0x0

    aget v9, p6, v9

    sub-int v3, v8, v9

    .line 1152
    .local v3, "leftDiff":I
    iget v8, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    const/4 v9, 0x1

    aget v9, p6, v9

    sub-int v6, v8, v9

    .line 1153
    .local v6, "rightDiff":I
    const/4 v8, 0x0

    invoke-static {v8, v3}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1154
    .local v4, "leftMargin":I
    const/4 v8, 0x0

    invoke-static {v8, v6}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 1155
    .local v7, "rightMargin":I
    add-int v2, v4, v7

    .line 1156
    .local v2, "hMargins":I
    const/4 v8, 0x0

    const/4 v9, 0x0

    neg-int v10, v3

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v9

    aput v9, p6, v8

    .line 1157
    const/4 v8, 0x1

    const/4 v9, 0x0

    neg-int v10, v6

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v9

    aput v9, p6, v8

    .line 1159
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getPaddingLeft()I

    move-result v8

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getPaddingRight()I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v2

    add-int/2addr v8, p3

    iget v9, v5, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    invoke-static {p2, v8, v9}, Landroid/support/v7/widget/Toolbar;->getChildMeasureSpec(III)I

    move-result v1

    .line 1161
    .local v1, "childWidthMeasureSpec":I
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getPaddingTop()I

    move-result v8

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getPaddingBottom()I

    move-result v9

    add-int/2addr v8, v9

    iget v9, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v8, v9

    iget v9, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v8, v9

    add-int v8, v8, p5

    iget v9, v5, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-static {p4, v8, v9}, Landroid/support/v7/widget/Toolbar;->getChildMeasureSpec(III)I

    move-result v0

    .line 1165
    .local v0, "childHeightMeasureSpec":I
    invoke-virtual {p1, v1, v0}, Landroid/view/View;->measure(II)V

    .line 1166
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    add-int/2addr v8, v2

    return v8
.end method

.method private measureChildConstrained(Landroid/view/View;IIIII)V
    .registers 15
    .param p1, "child"    # Landroid/view/View;
    .param p2, "parentWidthSpec"    # I
    .param p3, "widthUsed"    # I
    .param p4, "parentHeightSpec"    # I
    .param p5, "heightUsed"    # I
    .param p6, "heightConstraint"    # I

    .prologue
    const/high16 v7, 0x40000000

    .line 1124
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 1126
    .local v3, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getPaddingLeft()I

    move-result v5

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getPaddingRight()I

    move-result v6

    add-int/2addr v5, v6

    iget v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v5, v6

    iget v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v5, v6

    add-int/2addr v5, p3

    iget v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    invoke-static {p2, v5, v6}, Landroid/support/v7/widget/Toolbar;->getChildMeasureSpec(III)I

    move-result v2

    .line 1129
    .local v2, "childWidthSpec":I
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getPaddingTop()I

    move-result v5

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getPaddingBottom()I

    move-result v6

    add-int/2addr v5, v6

    iget v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v5, v6

    iget v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v5, v6

    add-int/2addr v5, p5

    iget v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-static {p4, v5, v6}, Landroid/support/v7/widget/Toolbar;->getChildMeasureSpec(III)I

    move-result v1

    .line 1133
    .local v1, "childHeightSpec":I
    invoke-static {v1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 1134
    .local v0, "childHeightMode":I
    if-eq v0, v7, :cond_4a

    if-ltz p6, :cond_4a

    .line 1135
    if-eqz v0, :cond_4e

    invoke-static {v1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    invoke-static {v5, p6}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 1138
    .local v4, "size":I
    :goto_46
    invoke-static {v4, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 1140
    .end local v4    # "size":I
    :cond_4a
    invoke-virtual {p1, v2, v1}, Landroid/view/View;->measure(II)V

    .line 1141
    return-void

    :cond_4e
    move v4, p6

    .line 1135
    goto :goto_46
.end method

.method private postShowOverflowMenu()V
    .registers 2

    .prologue
    .line 1062
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mShowOverflowMenuRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/Toolbar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1063
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mShowOverflowMenuRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/Toolbar;->post(Ljava/lang/Runnable;)Z

    .line 1064
    return-void
.end method

.method private setChildVisibilityForExpandedActionView(Z)V
    .registers 8
    .param p1, "expand"    # Z

    .prologue
    .line 1733
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getChildCount()I

    move-result v1

    .line 1734
    .local v1, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    if-ge v2, v1, :cond_26

    .line 1735
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/Toolbar;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1736
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1737
    .local v3, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    iget v4, v3, Landroid/support/v7/widget/Toolbar$LayoutParams;->mViewType:I

    const/4 v5, 0x2

    if-eq v4, v5, :cond_21

    iget-object v4, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eq v0, v4, :cond_21

    .line 1738
    if-eqz p1, :cond_24

    const/16 v4, 0x8

    :goto_1e
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 1734
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 1738
    :cond_24
    const/4 v4, 0x0

    goto :goto_1e

    .line 1741
    .end local v0    # "child":Landroid/view/View;
    .end local v3    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_26
    return-void
.end method

.method private shouldCollapse()Z
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 1173
    iget-boolean v4, p0, Landroid/support/v7/widget/Toolbar;->mCollapsible:Z

    if-nez v4, :cond_6

    .line 1183
    :cond_5
    :goto_5
    return v3

    .line 1175
    :cond_6
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getChildCount()I

    move-result v1

    .line 1176
    .local v1, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    if-ge v2, v1, :cond_26

    .line 1177
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/Toolbar;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1178
    .local v0, "child":Landroid/view/View;
    invoke-direct {p0, v0}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_23

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    if-lez v4, :cond_23

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    if-gtz v4, :cond_5

    .line 1176
    :cond_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 1183
    .end local v0    # "child":Landroid/view/View;
    :cond_26
    const/4 v3, 0x1

    goto :goto_5
.end method

.method private shouldLayout(Landroid/view/View;)Z
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1678
    if-eqz p1, :cond_12

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, p0, :cond_12

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private updateChildVisibilityForExpandedActionView(Landroid/view/View;)V
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 1744
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1745
    .local v0, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    iget v1, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->mViewType:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_18

    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eq p1, v1, :cond_18

    .line 1746
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedActionView:Landroid/view/View;

    if-eqz v1, :cond_19

    const/16 v1, 0x8

    :goto_15
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1748
    :cond_18
    return-void

    .line 1746
    :cond_19
    const/4 v1, 0x0

    goto :goto_15
.end method


# virtual methods
.method public canShowOverflowMenu()Z
    .registers 2

    .prologue
    .line 329
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getVisibility()I

    move-result v0

    if-nez v0, :cond_14

    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eqz v0, :cond_14

    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuView;->isOverflowReserved()Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1717
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v0

    if-eqz v0, :cond_c

    instance-of v0, p1, Landroid/support/v7/widget/Toolbar$LayoutParams;

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public collapseActionView()V
    .registers 3

    .prologue
    .line 534
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    if-nez v1, :cond_b

    const/4 v0, 0x0

    .line 536
    .local v0, "item":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    :goto_5
    if-eqz v0, :cond_a

    .line 537
    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->collapseActionView()Z

    .line 539
    :cond_a
    return-void

    .line 534
    .end local v0    # "item":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    :cond_b
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    iget-object v0, v1, Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;->mCurrentExpandedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    goto :goto_5
.end method

.method public dismissPopupMenus()V
    .registers 2

    .prologue
    .line 405
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eqz v0, :cond_9

    .line 406
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuView;->dismissPopupMenus()V

    .line 408
    :cond_9
    return-void
.end method

.method protected generateDefaultLayoutParams()Landroid/support/v7/widget/Toolbar$LayoutParams;
    .registers 3

    .prologue
    const/4 v1, -0x2

    .line 1712
    new-instance v0, Landroid/support/v7/widget/Toolbar$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/support/v7/widget/Toolbar$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .prologue
    .line 107
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->generateDefaultLayoutParams()Landroid/support/v7/widget/Toolbar$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/support/v7/widget/Toolbar$LayoutParams;
    .registers 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 1694
    new-instance v0, Landroid/support/v7/widget/Toolbar$LayoutParams;

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/v7/widget/Toolbar$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/Toolbar$LayoutParams;
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1699
    instance-of v0, p1, Landroid/support/v7/widget/Toolbar$LayoutParams;

    if-eqz v0, :cond_c

    .line 1700
    new-instance v0, Landroid/support/v7/widget/Toolbar$LayoutParams;

    check-cast p1, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .end local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v0, p1}, Landroid/support/v7/widget/Toolbar$LayoutParams;-><init>(Landroid/support/v7/widget/Toolbar$LayoutParams;)V

    .line 1706
    :goto_b
    return-object v0

    .line 1701
    .restart local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    :cond_c
    instance-of v0, p1, Landroid/support/v7/app/ActionBar$LayoutParams;

    if-eqz v0, :cond_18

    .line 1702
    new-instance v0, Landroid/support/v7/widget/Toolbar$LayoutParams;

    check-cast p1, Landroid/support/v7/app/ActionBar$LayoutParams;

    .end local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v0, p1}, Landroid/support/v7/widget/Toolbar$LayoutParams;-><init>(Landroid/support/v7/app/ActionBar$LayoutParams;)V

    goto :goto_b

    .line 1703
    .restart local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    :cond_18
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_24

    .line 1704
    new-instance v0, Landroid/support/v7/widget/Toolbar$LayoutParams;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v0, p1}, Landroid/support/v7/widget/Toolbar$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_b

    .line 1706
    .restart local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    :cond_24
    new-instance v0, Landroid/support/v7/widget/Toolbar$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/Toolbar$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_b
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3
    .param p1, "x0"    # Landroid/util/AttributeSet;

    .prologue
    .line 107
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/Toolbar;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/support/v7/widget/Toolbar$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3
    .param p1, "x0"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 107
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/Toolbar;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/Toolbar$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public getContentInsetEnd()I
    .registers 2

    .prologue
    .line 927
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mContentInsets:Landroid/support/v7/internal/widget/RtlSpacingHelper;

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/RtlSpacingHelper;->getEnd()I

    move-result v0

    return v0
.end method

.method public getContentInsetLeft()I
    .registers 2

    .prologue
    .line 966
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mContentInsets:Landroid/support/v7/internal/widget/RtlSpacingHelper;

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/RtlSpacingHelper;->getLeft()I

    move-result v0

    return v0
.end method

.method public getContentInsetRight()I
    .registers 2

    .prologue
    .line 985
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mContentInsets:Landroid/support/v7/internal/widget/RtlSpacingHelper;

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/RtlSpacingHelper;->getRight()I

    move-result v0

    return v0
.end method

.method public getContentInsetStart()I
    .registers 2

    .prologue
    .line 908
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mContentInsets:Landroid/support/v7/internal/widget/RtlSpacingHelper;

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/RtlSpacingHelper;->getStart()I

    move-result v0

    return v0
.end method

.method public getLogo()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 462
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getLogoDescription()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 500
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getMenu()Landroid/view/Menu;
    .registers 2

    .prologue
    .line 814
    invoke-direct {p0}, Landroid/support/v7/widget/Toolbar;->ensureMenu()V

    .line 815
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuView;->getMenu()Landroid/view/Menu;

    move-result-object v0

    return-object v0
.end method

.method public getNavigationContentDescription()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 706
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getNavigationIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 788
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getPopupTheme()I
    .registers 2

    .prologue
    .line 304
    iget v0, p0, Landroid/support/v7/widget/Toolbar;->mPopupTheme:I

    return v0
.end method

.method public getSubtitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 603
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 547
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mTitleText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getWrapper()Landroid/support/v7/internal/widget/DecorToolbar;
    .registers 3

    .prologue
    .line 1726
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mWrapper:Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;

    if-nez v0, :cond_c

    .line 1727
    new-instance v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;-><init>(Landroid/support/v7/widget/Toolbar;Z)V

    iput-object v0, p0, Landroid/support/v7/widget/Toolbar;->mWrapper:Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;

    .line 1729
    :cond_c
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mWrapper:Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;

    return-object v0
.end method

.method public hasExpandedActionView()Z
    .registers 2

    .prologue
    .line 520
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    if-eqz v0, :cond_c

    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;->mCurrentExpandedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public hideOverflowMenu()Z
    .registers 2

    .prologue
    .line 362
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuView;->hideOverflowMenu()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isOverflowMenuShowPending()Z
    .registers 2

    .prologue
    .line 344
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuView;->isOverflowMenuShowPending()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isOverflowMenuShowing()Z
    .registers 2

    .prologue
    .line 339
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuView;->isOverflowMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 1068
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 1069
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mShowOverflowMenuRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/Toolbar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1070
    return-void
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 8
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/16 v5, 0x9

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1103
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    .line 1104
    .local v0, "action":I
    if-ne v0, v5, :cond_c

    .line 1105
    iput-boolean v3, p0, Landroid/support/v7/widget/Toolbar;->mEatingHover:Z

    .line 1108
    :cond_c
    iget-boolean v2, p0, Landroid/support/v7/widget/Toolbar;->mEatingHover:Z

    if-nez v2, :cond_1a

    .line 1109
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onHoverEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 1110
    .local v1, "handled":Z
    if-ne v0, v5, :cond_1a

    if-nez v1, :cond_1a

    .line 1111
    iput-boolean v4, p0, Landroid/support/v7/widget/Toolbar;->mEatingHover:Z

    .line 1115
    .end local v1    # "handled":Z
    :cond_1a
    const/16 v2, 0xa

    if-eq v0, v2, :cond_21

    const/4 v2, 0x3

    if-ne v0, v2, :cond_23

    .line 1116
    :cond_21
    iput-boolean v3, p0, Landroid/support/v7/widget/Toolbar;->mEatingHover:Z

    .line 1119
    :cond_23
    return v4
.end method

.method protected onLayout(ZIIII)V
    .registers 56
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 1324
    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v46

    const/16 v47, 0x1

    move/from16 v0, v46

    move/from16 v1, v47

    if-ne v0, v1, :cond_319

    const/16 v16, 0x1

    .line 1325
    .local v16, "isRtl":Z
    :goto_e
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getWidth()I

    move-result v45

    .line 1326
    .local v45, "width":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getHeight()I

    move-result v14

    .line 1327
    .local v14, "height":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getPaddingLeft()I

    move-result v24

    .line 1328
    .local v24, "paddingLeft":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getPaddingRight()I

    move-result v25

    .line 1329
    .local v25, "paddingRight":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getPaddingTop()I

    move-result v26

    .line 1330
    .local v26, "paddingTop":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getPaddingBottom()I

    move-result v23

    .line 1331
    .local v23, "paddingBottom":I
    move/from16 v20, v24

    .line 1332
    .local v20, "left":I
    sub-int v29, v45, v25

    .line 1334
    .local v29, "right":I
    move-object/from16 v0, p0

    iget-object v12, v0, Landroid/support/v7/widget/Toolbar;->mTempMargins:[I

    .line 1335
    .local v12, "collapsingMargins":[I
    const/16 v46, 0x0

    const/16 v47, 0x1

    const/16 v48, 0x0

    aput v48, v12, v47

    aput v48, v12, v46

    .line 1338
    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v5

    .line 1340
    .local v5, "alignmentHeight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v46

    if-eqz v46, :cond_5e

    .line 1341
    if-eqz v16, :cond_31d

    .line 1342
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v29

    invoke-direct {v0, v1, v2, v12, v5}, Landroid/support/v7/widget/Toolbar;->layoutChildRight(Landroid/view/View;I[II)I

    move-result v29

    .line 1350
    :cond_5e
    :goto_5e
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v46

    if-eqz v46, :cond_80

    .line 1351
    if-eqz v16, :cond_32f

    .line 1352
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v29

    invoke-direct {v0, v1, v2, v12, v5}, Landroid/support/v7/widget/Toolbar;->layoutChildRight(Landroid/view/View;I[II)I

    move-result v29

    .line 1360
    :cond_80
    :goto_80
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v46

    if-eqz v46, :cond_a2

    .line 1361
    if-eqz v16, :cond_341

    .line 1362
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v20

    invoke-direct {v0, v1, v2, v12, v5}, Landroid/support/v7/widget/Toolbar;->layoutChildLeft(Landroid/view/View;I[II)I

    move-result v20

    .line 1370
    :cond_a2
    :goto_a2
    const/16 v46, 0x0

    const/16 v47, 0x0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getContentInsetLeft()I

    move-result v48

    sub-int v48, v48, v20

    invoke-static/range {v47 .. v48}, Ljava/lang/Math;->max(II)I

    move-result v47

    aput v47, v12, v46

    .line 1371
    const/16 v46, 0x1

    const/16 v47, 0x0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getContentInsetRight()I

    move-result v48

    sub-int v49, v45, v25

    sub-int v49, v49, v29

    sub-int v48, v48, v49

    invoke-static/range {v47 .. v48}, Ljava/lang/Math;->max(II)I

    move-result v47

    aput v47, v12, v46

    .line 1372
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getContentInsetLeft()I

    move-result v46

    move/from16 v0, v20

    move/from16 v1, v46

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v20

    .line 1373
    sub-int v46, v45, v25

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getContentInsetRight()I

    move-result v47

    sub-int v46, v46, v47

    move/from16 v0, v29

    move/from16 v1, v46

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v29

    .line 1375
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mExpandedActionView:Landroid/view/View;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v46

    if-eqz v46, :cond_104

    .line 1376
    if-eqz v16, :cond_353

    .line 1377
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mExpandedActionView:Landroid/view/View;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v29

    invoke-direct {v0, v1, v2, v12, v5}, Landroid/support/v7/widget/Toolbar;->layoutChildRight(Landroid/view/View;I[II)I

    move-result v29

    .line 1385
    :cond_104
    :goto_104
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v46

    if-eqz v46, :cond_126

    .line 1386
    if-eqz v16, :cond_365

    .line 1387
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v29

    invoke-direct {v0, v1, v2, v12, v5}, Landroid/support/v7/widget/Toolbar;->layoutChildRight(Landroid/view/View;I[II)I

    move-result v29

    .line 1395
    :cond_126
    :goto_126
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v18

    .line 1396
    .local v18, "layoutTitle":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v17

    .line 1397
    .local v17, "layoutSubtitle":Z
    const/16 v39, 0x0

    .line 1398
    .local v39, "titleHeight":I
    if-eqz v18, :cond_16e

    .line 1399
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v22

    check-cast v22, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1400
    .local v22, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    move-object/from16 v0, v22

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->topMargin:I

    move/from16 v46, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v47, v0

    invoke-virtual/range {v47 .. v47}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v47

    add-int v46, v46, v47

    move-object/from16 v0, v22

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->bottomMargin:I

    move/from16 v47, v0

    add-int v46, v46, v47

    add-int v39, v39, v46

    .line 1402
    .end local v22    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_16e
    if-eqz v17, :cond_198

    .line 1403
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v22

    check-cast v22, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1404
    .restart local v22    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    move-object/from16 v0, v22

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->topMargin:I

    move/from16 v46, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v47, v0

    invoke-virtual/range {v47 .. v47}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v47

    add-int v46, v46, v47

    move-object/from16 v0, v22

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->bottomMargin:I

    move/from16 v47, v0

    add-int v46, v46, v47

    add-int v39, v39, v46

    .line 1407
    .end local v22    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_198
    if-nez v18, :cond_19c

    if-eqz v17, :cond_2de

    .line 1409
    :cond_19c
    if-eqz v18, :cond_377

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v43, v0

    .line 1410
    .local v43, "topChild":Landroid/view/View;
    :goto_1a4
    if-eqz v17, :cond_37f

    move-object/from16 v0, p0

    iget-object v6, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    .line 1411
    .local v6, "bottomChild":Landroid/view/View;
    :goto_1aa
    invoke-virtual/range {v43 .. v43}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v44

    check-cast v44, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1412
    .local v44, "toplp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1413
    .local v7, "bottomlp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    if-eqz v18, :cond_1c4

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v46

    if-gtz v46, :cond_1d2

    :cond_1c4
    if-eqz v17, :cond_385

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v46

    if-lez v46, :cond_385

    :cond_1d2
    const/16 v38, 0x1

    .line 1416
    .local v38, "titleHasWidth":Z
    :goto_1d4
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mGravity:I

    move/from16 v46, v0

    and-int/lit8 v46, v46, 0x70

    sparse-switch v46, :sswitch_data_56a

    .line 1422
    sub-int v46, v14, v26

    sub-int v31, v46, v23

    .line 1423
    .local v31, "space":I
    sub-int v46, v31, v39

    div-int/lit8 v32, v46, 0x2

    .line 1424
    .local v32, "spaceAbove":I
    move-object/from16 v0, v44

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->topMargin:I

    move/from16 v46, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginTop:I

    move/from16 v47, v0

    add-int v46, v46, v47

    move/from16 v0, v32

    move/from16 v1, v46

    if-ge v0, v1, :cond_39f

    .line 1425
    move-object/from16 v0, v44

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->topMargin:I

    move/from16 v46, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginTop:I

    move/from16 v47, v0

    add-int v32, v46, v47

    .line 1434
    :cond_209
    :goto_209
    add-int v42, v26, v32

    .line 1441
    .end local v31    # "space":I
    .end local v32    # "spaceAbove":I
    .local v42, "titleTop":I
    :goto_20b
    if-eqz v16, :cond_3eb

    .line 1442
    if-eqz v38, :cond_3e7

    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginStart:I

    move/from16 v46, v0

    :goto_215
    const/16 v47, 0x1

    aget v47, v12, v47

    sub-int v28, v46, v47

    .line 1443
    .local v28, "rd":I
    const/16 v46, 0x0

    move/from16 v0, v46

    move/from16 v1, v28

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v46

    sub-int v29, v29, v46

    .line 1444
    const/16 v46, 0x1

    const/16 v47, 0x0

    move/from16 v0, v28

    neg-int v0, v0

    move/from16 v48, v0

    invoke-static/range {v47 .. v48}, Ljava/lang/Math;->max(II)I

    move-result v47

    aput v47, v12, v46

    .line 1445
    move/from16 v41, v29

    .line 1446
    .local v41, "titleRight":I
    move/from16 v36, v29

    .line 1448
    .local v36, "subtitleRight":I
    if-eqz v18, :cond_283

    .line 1449
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v22

    check-cast v22, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1450
    .restart local v22    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v46

    sub-int v40, v41, v46

    .line 1451
    .local v40, "titleLeft":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v46

    add-int v37, v42, v46

    .line 1452
    .local v37, "titleBottom":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    move-object/from16 v0, v46

    move/from16 v1, v40

    move/from16 v2, v42

    move/from16 v3, v41

    move/from16 v4, v37

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->layout(IIII)V

    .line 1453
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginEnd:I

    move/from16 v46, v0

    sub-int v41, v40, v46

    .line 1454
    move-object/from16 v0, v22

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->bottomMargin:I

    move/from16 v46, v0

    add-int v42, v37, v46

    .line 1456
    .end local v22    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    .end local v37    # "titleBottom":I
    .end local v40    # "titleLeft":I
    :cond_283
    if-eqz v17, :cond_2d4

    .line 1457
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v22

    check-cast v22, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1458
    .restart local v22    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    move-object/from16 v0, v22

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->topMargin:I

    move/from16 v46, v0

    add-int v42, v42, v46

    .line 1459
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v46

    sub-int v35, v36, v46

    .line 1460
    .local v35, "subtitleLeft":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v46

    add-int v34, v42, v46

    .line 1461
    .local v34, "subtitleBottom":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    move-object/from16 v0, v46

    move/from16 v1, v35

    move/from16 v2, v42

    move/from16 v3, v36

    move/from16 v4, v34

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->layout(IIII)V

    .line 1462
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginEnd:I

    move/from16 v46, v0

    sub-int v36, v36, v46

    .line 1463
    move-object/from16 v0, v22

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->bottomMargin:I

    move/from16 v46, v0

    add-int v42, v34, v46

    .line 1465
    .end local v22    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    .end local v34    # "subtitleBottom":I
    .end local v35    # "subtitleLeft":I
    :cond_2d4
    if-eqz v38, :cond_2de

    .line 1466
    move/from16 v0, v41

    move/from16 v1, v36

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v29

    .line 1501
    .end local v6    # "bottomChild":Landroid/view/View;
    .end local v7    # "bottomlp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    .end local v28    # "rd":I
    .end local v36    # "subtitleRight":I
    .end local v38    # "titleHasWidth":Z
    .end local v41    # "titleRight":I
    .end local v42    # "titleTop":I
    .end local v43    # "topChild":Landroid/view/View;
    .end local v44    # "toplp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_2de
    :goto_2de
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTempViews:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    const/16 v47, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v47

    invoke-direct {v0, v1, v2}, Landroid/support/v7/widget/Toolbar;->addCustomViewsWithGravity(Ljava/util/List;I)V

    .line 1502
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTempViews:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Ljava/util/ArrayList;->size()I

    move-result v21

    .line 1503
    .local v21, "leftViewsCount":I
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_2fa
    move/from16 v0, v21

    if-ge v15, v0, :cond_4c2

    .line 1504
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTempViews:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    move-object/from16 v0, v46

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Landroid/view/View;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v20

    invoke-direct {v0, v1, v2, v12, v5}, Landroid/support/v7/widget/Toolbar;->layoutChildLeft(Landroid/view/View;I[II)I

    move-result v20

    .line 1503
    add-int/lit8 v15, v15, 0x1

    goto :goto_2fa

    .line 1324
    .end local v5    # "alignmentHeight":I
    .end local v12    # "collapsingMargins":[I
    .end local v14    # "height":I
    .end local v15    # "i":I
    .end local v16    # "isRtl":Z
    .end local v17    # "layoutSubtitle":Z
    .end local v18    # "layoutTitle":Z
    .end local v20    # "left":I
    .end local v21    # "leftViewsCount":I
    .end local v23    # "paddingBottom":I
    .end local v24    # "paddingLeft":I
    .end local v25    # "paddingRight":I
    .end local v26    # "paddingTop":I
    .end local v29    # "right":I
    .end local v39    # "titleHeight":I
    .end local v45    # "width":I
    :cond_319
    const/16 v16, 0x0

    goto/16 :goto_e

    .line 1345
    .restart local v5    # "alignmentHeight":I
    .restart local v12    # "collapsingMargins":[I
    .restart local v14    # "height":I
    .restart local v16    # "isRtl":Z
    .restart local v20    # "left":I
    .restart local v23    # "paddingBottom":I
    .restart local v24    # "paddingLeft":I
    .restart local v25    # "paddingRight":I
    .restart local v26    # "paddingTop":I
    .restart local v29    # "right":I
    .restart local v45    # "width":I
    :cond_31d
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v20

    invoke-direct {v0, v1, v2, v12, v5}, Landroid/support/v7/widget/Toolbar;->layoutChildLeft(Landroid/view/View;I[II)I

    move-result v20

    goto/16 :goto_5e

    .line 1355
    :cond_32f
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v20

    invoke-direct {v0, v1, v2, v12, v5}, Landroid/support/v7/widget/Toolbar;->layoutChildLeft(Landroid/view/View;I[II)I

    move-result v20

    goto/16 :goto_80

    .line 1365
    :cond_341
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v29

    invoke-direct {v0, v1, v2, v12, v5}, Landroid/support/v7/widget/Toolbar;->layoutChildRight(Landroid/view/View;I[II)I

    move-result v29

    goto/16 :goto_a2

    .line 1380
    :cond_353
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mExpandedActionView:Landroid/view/View;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v20

    invoke-direct {v0, v1, v2, v12, v5}, Landroid/support/v7/widget/Toolbar;->layoutChildLeft(Landroid/view/View;I[II)I

    move-result v20

    goto/16 :goto_104

    .line 1390
    :cond_365
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v20

    invoke-direct {v0, v1, v2, v12, v5}, Landroid/support/v7/widget/Toolbar;->layoutChildLeft(Landroid/view/View;I[II)I

    move-result v20

    goto/16 :goto_126

    .line 1409
    .restart local v17    # "layoutSubtitle":Z
    .restart local v18    # "layoutTitle":Z
    .restart local v39    # "titleHeight":I
    :cond_377
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v43, v0

    goto/16 :goto_1a4

    .line 1410
    .restart local v43    # "topChild":Landroid/view/View;
    :cond_37f
    move-object/from16 v0, p0

    iget-object v6, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    goto/16 :goto_1aa

    .line 1413
    .restart local v6    # "bottomChild":Landroid/view/View;
    .restart local v7    # "bottomlp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    .restart local v44    # "toplp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_385
    const/16 v38, 0x0

    goto/16 :goto_1d4

    .line 1418
    .restart local v38    # "titleHasWidth":Z
    :sswitch_389
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getPaddingTop()I

    move-result v46

    move-object/from16 v0, v44

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->topMargin:I

    move/from16 v47, v0

    add-int v46, v46, v47

    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginTop:I

    move/from16 v47, v0

    add-int v42, v46, v47

    .line 1419
    .restart local v42    # "titleTop":I
    goto/16 :goto_20b

    .line 1427
    .end local v42    # "titleTop":I
    .restart local v31    # "space":I
    .restart local v32    # "spaceAbove":I
    :cond_39f
    sub-int v46, v14, v23

    sub-int v46, v46, v39

    sub-int v46, v46, v32

    sub-int v33, v46, v26

    .line 1429
    .local v33, "spaceBelow":I
    move-object/from16 v0, v44

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->bottomMargin:I

    move/from16 v46, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginBottom:I

    move/from16 v47, v0

    add-int v46, v46, v47

    move/from16 v0, v33

    move/from16 v1, v46

    if-ge v0, v1, :cond_209

    .line 1430
    const/16 v46, 0x0

    iget v0, v7, Landroid/support/v7/widget/Toolbar$LayoutParams;->bottomMargin:I

    move/from16 v47, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginBottom:I

    move/from16 v48, v0

    add-int v47, v47, v48

    sub-int v47, v47, v33

    sub-int v47, v32, v47

    invoke-static/range {v46 .. v47}, Ljava/lang/Math;->max(II)I

    move-result v32

    goto/16 :goto_209

    .line 1437
    .end local v31    # "space":I
    .end local v32    # "spaceAbove":I
    .end local v33    # "spaceBelow":I
    :sswitch_3d3
    sub-int v46, v14, v23

    iget v0, v7, Landroid/support/v7/widget/Toolbar$LayoutParams;->bottomMargin:I

    move/from16 v47, v0

    sub-int v46, v46, v47

    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginBottom:I

    move/from16 v47, v0

    sub-int v46, v46, v47

    sub-int v42, v46, v39

    .restart local v42    # "titleTop":I
    goto/16 :goto_20b

    .line 1442
    :cond_3e7
    const/16 v46, 0x0

    goto/16 :goto_215

    .line 1469
    :cond_3eb
    if-eqz v38, :cond_4be

    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginStart:I

    move/from16 v46, v0

    :goto_3f3
    const/16 v47, 0x0

    aget v47, v12, v47

    sub-int v19, v46, v47

    .line 1470
    .local v19, "ld":I
    const/16 v46, 0x0

    move/from16 v0, v46

    move/from16 v1, v19

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v46

    add-int v20, v20, v46

    .line 1471
    const/16 v46, 0x0

    const/16 v47, 0x0

    move/from16 v0, v19

    neg-int v0, v0

    move/from16 v48, v0

    invoke-static/range {v47 .. v48}, Ljava/lang/Math;->max(II)I

    move-result v47

    aput v47, v12, v46

    .line 1472
    move/from16 v40, v20

    .line 1473
    .restart local v40    # "titleLeft":I
    move/from16 v35, v20

    .line 1475
    .restart local v35    # "subtitleLeft":I
    if-eqz v18, :cond_461

    .line 1476
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v22

    check-cast v22, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1477
    .restart local v22    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v46

    add-int v41, v40, v46

    .line 1478
    .restart local v41    # "titleRight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v46

    add-int v37, v42, v46

    .line 1479
    .restart local v37    # "titleBottom":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    move-object/from16 v0, v46

    move/from16 v1, v40

    move/from16 v2, v42

    move/from16 v3, v41

    move/from16 v4, v37

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->layout(IIII)V

    .line 1480
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginEnd:I

    move/from16 v46, v0

    add-int v40, v41, v46

    .line 1481
    move-object/from16 v0, v22

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->bottomMargin:I

    move/from16 v46, v0

    add-int v42, v37, v46

    .line 1483
    .end local v22    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    .end local v37    # "titleBottom":I
    .end local v41    # "titleRight":I
    :cond_461
    if-eqz v17, :cond_4b2

    .line 1484
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v22

    check-cast v22, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1485
    .restart local v22    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    move-object/from16 v0, v22

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->topMargin:I

    move/from16 v46, v0

    add-int v42, v42, v46

    .line 1486
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v46

    add-int v36, v35, v46

    .line 1487
    .restart local v36    # "subtitleRight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v46

    add-int v34, v42, v46

    .line 1488
    .restart local v34    # "subtitleBottom":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v46, v0

    move-object/from16 v0, v46

    move/from16 v1, v35

    move/from16 v2, v42

    move/from16 v3, v36

    move/from16 v4, v34

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->layout(IIII)V

    .line 1489
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginEnd:I

    move/from16 v46, v0

    add-int v35, v36, v46

    .line 1490
    move-object/from16 v0, v22

    iget v0, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->bottomMargin:I

    move/from16 v46, v0

    add-int v42, v34, v46

    .line 1492
    .end local v22    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    .end local v34    # "subtitleBottom":I
    .end local v36    # "subtitleRight":I
    :cond_4b2
    if-eqz v38, :cond_2de

    .line 1493
    move/from16 v0, v40

    move/from16 v1, v35

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v20

    goto/16 :goto_2de

    .line 1469
    .end local v19    # "ld":I
    .end local v35    # "subtitleLeft":I
    .end local v40    # "titleLeft":I
    :cond_4be
    const/16 v46, 0x0

    goto/16 :goto_3f3

    .line 1508
    .end local v6    # "bottomChild":Landroid/view/View;
    .end local v7    # "bottomlp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    .end local v38    # "titleHasWidth":Z
    .end local v42    # "titleTop":I
    .end local v43    # "topChild":Landroid/view/View;
    .end local v44    # "toplp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    .restart local v15    # "i":I
    .restart local v21    # "leftViewsCount":I
    :cond_4c2
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTempViews:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    const/16 v47, 0x5

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v47

    invoke-direct {v0, v1, v2}, Landroid/support/v7/widget/Toolbar;->addCustomViewsWithGravity(Ljava/util/List;I)V

    .line 1509
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTempViews:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Ljava/util/ArrayList;->size()I

    move-result v30

    .line 1510
    .local v30, "rightViewsCount":I
    const/4 v15, 0x0

    :goto_4de
    move/from16 v0, v30

    if-ge v15, v0, :cond_4fd

    .line 1511
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTempViews:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    move-object/from16 v0, v46

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Landroid/view/View;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v29

    invoke-direct {v0, v1, v2, v12, v5}, Landroid/support/v7/widget/Toolbar;->layoutChildRight(Landroid/view/View;I[II)I

    move-result v29

    .line 1510
    add-int/lit8 v15, v15, 0x1

    goto :goto_4de

    .line 1517
    :cond_4fd
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTempViews:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    const/16 v47, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move/from16 v2, v47

    invoke-direct {v0, v1, v2}, Landroid/support/v7/widget/Toolbar;->addCustomViewsWithGravity(Ljava/util/List;I)V

    .line 1518
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTempViews:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v12}, Landroid/support/v7/widget/Toolbar;->getViewListMeasuredWidth(Ljava/util/List;[I)I

    move-result v11

    .line 1519
    .local v11, "centerViewsWidth":I
    sub-int v46, v45, v24

    sub-int v46, v46, v25

    div-int/lit8 v46, v46, 0x2

    add-int v27, v24, v46

    .line 1520
    .local v27, "parentCenter":I
    div-int/lit8 v13, v11, 0x2

    .line 1521
    .local v13, "halfCenterViewsWidth":I
    sub-int v8, v27, v13

    .line 1522
    .local v8, "centerLeft":I
    add-int v9, v8, v11

    .line 1523
    .local v9, "centerRight":I
    move/from16 v0, v20

    if-ge v8, v0, :cond_556

    .line 1524
    move/from16 v8, v20

    .line 1529
    :cond_530
    :goto_530
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTempViews:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1530
    .local v10, "centerViewsCount":I
    const/4 v15, 0x0

    :goto_53b
    if-ge v15, v10, :cond_55f

    .line 1531
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTempViews:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    move-object/from16 v0, v46

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Landroid/view/View;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v8, v12, v5}, Landroid/support/v7/widget/Toolbar;->layoutChildLeft(Landroid/view/View;I[II)I

    move-result v8

    .line 1530
    add-int/lit8 v15, v15, 0x1

    goto :goto_53b

    .line 1525
    .end local v10    # "centerViewsCount":I
    :cond_556
    move/from16 v0, v29

    if-le v9, v0, :cond_530

    .line 1526
    sub-int v46, v9, v29

    sub-int v8, v8, v46

    goto :goto_530

    .line 1535
    .restart local v10    # "centerViewsCount":I
    :cond_55f
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/Toolbar;->mTempViews:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Ljava/util/ArrayList;->clear()V

    .line 1536
    return-void

    .line 1416
    nop

    :sswitch_data_56a
    .sparse-switch
        0x30 -> :sswitch_389
        0x50 -> :sswitch_3d3
    .end sparse-switch
.end method

.method protected onMeasure(II)V
    .registers 40
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 1188
    const/4 v6, 0x0

    .line 1189
    .local v6, "width":I
    const/16 v25, 0x0

    .line 1190
    .local v25, "height":I
    const/16 v22, 0x0

    .line 1192
    .local v22, "childState":I
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v7/widget/Toolbar;->mTempMargins:[I

    .line 1195
    .local v13, "collapsingMargins":[I
    invoke-static/range {p0 .. p0}, Landroid/support/v7/internal/widget/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_201

    .line 1196
    const/16 v29, 0x1

    .line 1197
    .local v29, "marginStartIndex":I
    const/16 v28, 0x0

    .line 1205
    .local v28, "marginEndIndex":I
    :goto_13
    const/16 v33, 0x0

    .line 1206
    .local v33, "navWidth":I
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_6e

    .line 1207
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget v9, v0, Landroid/support/v7/widget/Toolbar;->mMaxButtonHeight:I

    move-object/from16 v3, p0

    move/from16 v5, p1

    move/from16 v7, p2

    invoke-direct/range {v3 .. v9}, Landroid/support/v7/widget/Toolbar;->measureChildConstrained(Landroid/view/View;IIIII)V

    .line 1209
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-virtual {v3}, Landroid/widget/ImageButton;->getMeasuredWidth()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Landroid/support/v7/widget/Toolbar;->getHorizontalMargins(Landroid/view/View;)I

    move-result v5

    add-int v33, v3, v5

    .line 1210
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-virtual {v3}, Landroid/widget/ImageButton;->getMeasuredHeight()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Landroid/support/v7/widget/Toolbar;->getVerticalMargins(Landroid/view/View;)I

    move-result v5

    add-int/2addr v3, v5

    move/from16 v0, v25

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v25

    .line 1212
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getMeasuredState(Landroid/view/View;)I

    move-result v3

    move/from16 v0, v22

    invoke-static {v0, v3}, Landroid/support/v7/internal/widget/ViewUtils;->combineMeasuredStates(II)I

    move-result v22

    .line 1216
    :cond_6e
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_c7

    .line 1217
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget v9, v0, Landroid/support/v7/widget/Toolbar;->mMaxButtonHeight:I

    move-object/from16 v3, p0

    move/from16 v5, p1

    move/from16 v7, p2

    invoke-direct/range {v3 .. v9}, Landroid/support/v7/widget/Toolbar;->measureChildConstrained(Landroid/view/View;IIIII)V

    .line 1219
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    invoke-virtual {v3}, Landroid/widget/ImageButton;->getMeasuredWidth()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Landroid/support/v7/widget/Toolbar;->getHorizontalMargins(Landroid/view/View;)I

    move-result v5

    add-int v33, v3, v5

    .line 1221
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    invoke-virtual {v3}, Landroid/widget/ImageButton;->getMeasuredHeight()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Landroid/support/v7/widget/Toolbar;->getVerticalMargins(Landroid/view/View;)I

    move-result v5

    add-int/2addr v3, v5

    move/from16 v0, v25

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v25

    .line 1223
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mCollapseButtonView:Landroid/widget/ImageButton;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getMeasuredState(Landroid/view/View;)I

    move-result v3

    move/from16 v0, v22

    invoke-static {v0, v3}, Landroid/support/v7/internal/widget/ViewUtils;->combineMeasuredStates(II)I

    move-result v22

    .line 1227
    :cond_c7
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getContentInsetStart()I

    move-result v24

    .line 1228
    .local v24, "contentInsetStart":I
    move/from16 v0, v24

    move/from16 v1, v33

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v3

    add-int/2addr v6, v3

    .line 1229
    const/4 v3, 0x0

    sub-int v5, v24, v33

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    aput v3, v13, v29

    .line 1231
    const/16 v32, 0x0

    .line 1232
    .local v32, "menuWidth":I
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_138

    .line 1233
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget v9, v0, Landroid/support/v7/widget/Toolbar;->mMaxButtonHeight:I

    move-object/from16 v3, p0

    move/from16 v5, p1

    move/from16 v7, p2

    invoke-direct/range {v3 .. v9}, Landroid/support/v7/widget/Toolbar;->measureChildConstrained(Landroid/view/View;IIIII)V

    .line 1235
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v3}, Landroid/support/v7/widget/ActionMenuView;->getMeasuredWidth()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Landroid/support/v7/widget/Toolbar;->getHorizontalMargins(Landroid/view/View;)I

    move-result v5

    add-int v32, v3, v5

    .line 1236
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v3}, Landroid/support/v7/widget/ActionMenuView;->getMeasuredHeight()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Landroid/support/v7/widget/Toolbar;->getVerticalMargins(Landroid/view/View;)I

    move-result v5

    add-int/2addr v3, v5

    move/from16 v0, v25

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v25

    .line 1238
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getMeasuredState(Landroid/view/View;)I

    move-result v3

    move/from16 v0, v22

    invoke-static {v0, v3}, Landroid/support/v7/internal/widget/ViewUtils;->combineMeasuredStates(II)I

    move-result v22

    .line 1242
    :cond_138
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getContentInsetEnd()I

    move-result v23

    .line 1243
    .local v23, "contentInsetEnd":I
    move/from16 v0, v23

    move/from16 v1, v32

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v3

    add-int/2addr v6, v3

    .line 1244
    const/4 v3, 0x0

    sub-int v5, v23, v32

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    aput v3, v13, v28

    .line 1246
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mExpandedActionView:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_192

    .line 1247
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/Toolbar;->mExpandedActionView:Landroid/view/View;

    const/4 v8, 0x0

    move-object/from16 v3, p0

    move/from16 v5, p1

    move/from16 v7, p2

    move-object v9, v13

    invoke-direct/range {v3 .. v9}, Landroid/support/v7/widget/Toolbar;->measureChildCollapseMargins(Landroid/view/View;IIII[I)I

    move-result v3

    add-int/2addr v6, v3

    .line 1249
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mExpandedActionView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/Toolbar;->mExpandedActionView:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Landroid/support/v7/widget/Toolbar;->getVerticalMargins(Landroid/view/View;)I

    move-result v5

    add-int/2addr v3, v5

    move/from16 v0, v25

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v25

    .line 1251
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mExpandedActionView:Landroid/view/View;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getMeasuredState(Landroid/view/View;)I

    move-result v3

    move/from16 v0, v22

    invoke-static {v0, v3}, Landroid/support/v7/internal/widget/ViewUtils;->combineMeasuredStates(II)I

    move-result v22

    .line 1255
    :cond_192
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_1d6

    .line 1256
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    const/4 v8, 0x0

    move-object/from16 v3, p0

    move/from16 v5, p1

    move/from16 v7, p2

    move-object v9, v13

    invoke-direct/range {v3 .. v9}, Landroid/support/v7/widget/Toolbar;->measureChildCollapseMargins(Landroid/view/View;IIII[I)I

    move-result v3

    add-int/2addr v6, v3

    .line 1258
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Landroid/support/v7/widget/Toolbar;->getVerticalMargins(Landroid/view/View;)I

    move-result v5

    add-int/2addr v3, v5

    move/from16 v0, v25

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v25

    .line 1260
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getMeasuredState(Landroid/view/View;)I

    move-result v3

    move/from16 v0, v22

    invoke-static {v0, v3}, Landroid/support/v7/internal/widget/ViewUtils;->combineMeasuredStates(II)I

    move-result v22

    .line 1264
    :cond_1d6
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getChildCount()I

    move-result v21

    .line 1265
    .local v21, "childCount":I
    const/16 v26, 0x0

    .local v26, "i":I
    :goto_1dc
    move/from16 v0, v26

    move/from16 v1, v21

    if-ge v0, v1, :cond_230

    .line 1266
    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 1267
    .local v4, "child":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v27

    check-cast v27, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 1268
    .local v27, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    move-object/from16 v0, v27

    iget v3, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->mViewType:I

    if-nez v3, :cond_1fe

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v3

    if-nez v3, :cond_207

    .line 1265
    :cond_1fe
    :goto_1fe
    add-int/lit8 v26, v26, 0x1

    goto :goto_1dc

    .line 1199
    .end local v4    # "child":Landroid/view/View;
    .end local v21    # "childCount":I
    .end local v23    # "contentInsetEnd":I
    .end local v24    # "contentInsetStart":I
    .end local v26    # "i":I
    .end local v27    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    .end local v28    # "marginEndIndex":I
    .end local v29    # "marginStartIndex":I
    .end local v32    # "menuWidth":I
    .end local v33    # "navWidth":I
    :cond_201
    const/16 v29, 0x0

    .line 1200
    .restart local v29    # "marginStartIndex":I
    const/16 v28, 0x1

    .restart local v28    # "marginEndIndex":I
    goto/16 :goto_13

    .line 1273
    .restart local v4    # "child":Landroid/view/View;
    .restart local v21    # "childCount":I
    .restart local v23    # "contentInsetEnd":I
    .restart local v24    # "contentInsetStart":I
    .restart local v26    # "i":I
    .restart local v27    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    .restart local v32    # "menuWidth":I
    .restart local v33    # "navWidth":I
    :cond_207
    const/4 v8, 0x0

    move-object/from16 v3, p0

    move/from16 v5, p1

    move/from16 v7, p2

    move-object v9, v13

    invoke-direct/range {v3 .. v9}, Landroid/support/v7/widget/Toolbar;->measureChildCollapseMargins(Landroid/view/View;IIII[I)I

    move-result v3

    add-int/2addr v6, v3

    .line 1275
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Landroid/support/v7/widget/Toolbar;->getVerticalMargins(Landroid/view/View;)I

    move-result v5

    add-int/2addr v3, v5

    move/from16 v0, v25

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v25

    .line 1276
    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->getMeasuredState(Landroid/view/View;)I

    move-result v3

    move/from16 v0, v22

    invoke-static {v0, v3}, Landroid/support/v7/internal/widget/ViewUtils;->combineMeasuredStates(II)I

    move-result v22

    goto :goto_1fe

    .line 1280
    .end local v4    # "child":Landroid/view/View;
    .end local v27    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_230
    const/16 v36, 0x0

    .line 1281
    .local v36, "titleWidth":I
    const/16 v34, 0x0

    .line 1282
    .local v34, "titleHeight":I
    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginTop:I

    move-object/from16 v0, p0

    iget v5, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginBottom:I

    add-int v12, v3, v5

    .line 1283
    .local v12, "titleVertMargins":I
    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginStart:I

    move-object/from16 v0, p0

    iget v5, v0, Landroid/support/v7/widget/Toolbar;->mTitleMarginEnd:I

    add-int v35, v3, v5

    .line 1284
    .local v35, "titleHorizMargins":I
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_29a

    .line 1285
    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    add-int v10, v6, v35

    move-object/from16 v7, p0

    move/from16 v9, p1

    move/from16 v11, p2

    invoke-direct/range {v7 .. v13}, Landroid/support/v7/widget/Toolbar;->measureChildCollapseMargins(Landroid/view/View;IIII[I)I

    move-result v36

    .line 1288
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Landroid/support/v7/widget/Toolbar;->getHorizontalMargins(Landroid/view/View;)I

    move-result v5

    add-int v36, v3, v5

    .line 1289
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Landroid/support/v7/widget/Toolbar;->getVerticalMargins(Landroid/view/View;)I

    move-result v5

    add-int v34, v3, v5

    .line 1290
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getMeasuredState(Landroid/view/View;)I

    move-result v3

    move/from16 v0, v22

    invoke-static {v0, v3}, Landroid/support/v7/internal/widget/ViewUtils;->combineMeasuredStates(II)I

    move-result v22

    .line 1293
    :cond_29a
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Landroid/support/v7/widget/Toolbar;->shouldLayout(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_2e3

    .line 1294
    move-object/from16 v0, p0

    iget-object v15, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    add-int v17, v6, v35

    add-int v19, v34, v12

    move-object/from16 v14, p0

    move/from16 v16, p1

    move/from16 v18, p2

    move-object/from16 v20, v13

    invoke-direct/range {v14 .. v20}, Landroid/support/v7/widget/Toolbar;->measureChildCollapseMargins(Landroid/view/View;IIII[I)I

    move-result v3

    move/from16 v0, v36

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v36

    .line 1298
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Landroid/support/v7/widget/Toolbar;->getVerticalMargins(Landroid/view/View;)I

    move-result v5

    add-int/2addr v3, v5

    add-int v34, v34, v3

    .line 1300
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getMeasuredState(Landroid/view/View;)I

    move-result v3

    move/from16 v0, v22

    invoke-static {v0, v3}, Landroid/support/v7/internal/widget/ViewUtils;->combineMeasuredStates(II)I

    move-result v22

    .line 1304
    :cond_2e3
    add-int v6, v6, v36

    .line 1305
    move/from16 v0, v25

    move/from16 v1, v34

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v25

    .line 1309
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getPaddingLeft()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getPaddingRight()I

    move-result v5

    add-int/2addr v3, v5

    add-int/2addr v6, v3

    .line 1310
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getPaddingTop()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getPaddingBottom()I

    move-result v5

    add-int/2addr v3, v5

    add-int v25, v25, v3

    .line 1312
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getSuggestedMinimumWidth()I

    move-result v3

    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/high16 v5, -0x1000000

    and-int v5, v5, v22

    move/from16 v0, p1

    invoke-static {v3, v0, v5}, Landroid/support/v4/view/ViewCompat;->resolveSizeAndState(III)I

    move-result v31

    .line 1315
    .local v31, "measuredWidth":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->getSuggestedMinimumHeight()I

    move-result v3

    move/from16 v0, v25

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    shl-int/lit8 v5, v22, 0x10

    move/from16 v0, p2

    invoke-static {v3, v0, v5}, Landroid/support/v4/view/ViewCompat;->resolveSizeAndState(III)I

    move-result v30

    .line 1319
    .local v30, "measuredHeight":I
    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/Toolbar;->shouldCollapse()Z

    move-result v3

    if-eqz v3, :cond_32e

    const/16 v30, 0x0

    .end local v30    # "measuredHeight":I
    :cond_32e
    move-object/from16 v0, p0

    move/from16 v1, v31

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/Toolbar;->setMeasuredDimension(II)V

    .line 1320
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 6
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 1045
    move-object v2, p1

    check-cast v2, Landroid/support/v7/widget/Toolbar$SavedState;

    .line 1046
    .local v2, "ss":Landroid/support/v7/widget/Toolbar$SavedState;
    invoke-virtual {v2}, Landroid/support/v7/widget/Toolbar$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v3

    invoke-super {p0, v3}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1048
    iget-object v3, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eqz v3, :cond_31

    iget-object v3, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v3}, Landroid/support/v7/widget/ActionMenuView;->peekMenu()Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-result-object v1

    .line 1049
    .local v1, "menu":Landroid/view/Menu;
    :goto_14
    iget v3, v2, Landroid/support/v7/widget/Toolbar$SavedState;->expandedMenuItemId:I

    if-eqz v3, :cond_29

    iget-object v3, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    if-eqz v3, :cond_29

    if-eqz v1, :cond_29

    .line 1050
    iget v3, v2, Landroid/support/v7/widget/Toolbar$SavedState;->expandedMenuItemId:I

    invoke-interface {v1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 1051
    .local v0, "item":Landroid/view/MenuItem;
    if-eqz v0, :cond_29

    .line 1052
    invoke-static {v0}, Landroid/support/v4/view/MenuItemCompat;->expandActionView(Landroid/view/MenuItem;)Z

    .line 1056
    .end local v0    # "item":Landroid/view/MenuItem;
    :cond_29
    iget-boolean v3, v2, Landroid/support/v7/widget/Toolbar$SavedState;->isOverflowOpen:Z

    if-eqz v3, :cond_30

    .line 1057
    invoke-direct {p0}, Landroid/support/v7/widget/Toolbar;->postShowOverflowMenu()V

    .line 1059
    :cond_30
    return-void

    .line 1048
    .end local v1    # "menu":Landroid/view/Menu;
    :cond_31
    const/4 v1, 0x0

    goto :goto_14
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 5
    .param p1, "layoutDirection"    # I

    .prologue
    const/4 v0, 0x1

    .line 308
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_a

    .line 309
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRtlPropertiesChanged(I)V

    .line 311
    :cond_a
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mContentInsets:Landroid/support/v7/internal/widget/RtlSpacingHelper;

    if-ne p1, v0, :cond_12

    :goto_e
    invoke-virtual {v1, v0}, Landroid/support/v7/internal/widget/RtlSpacingHelper;->setDirection(Z)V

    .line 312
    return-void

    .line 311
    :cond_12
    const/4 v0, 0x0

    goto :goto_e
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 3

    .prologue
    .line 1033
    new-instance v0, Landroid/support/v7/widget/Toolbar$SavedState;

    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/Toolbar$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 1035
    .local v0, "state":Landroid/support/v7/widget/Toolbar$SavedState;
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    if-eqz v1, :cond_1d

    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    iget-object v1, v1, Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;->mCurrentExpandedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    if-eqz v1, :cond_1d

    .line 1036
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    iget-object v1, v1, Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;->mCurrentExpandedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    invoke-virtual {v1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getItemId()I

    move-result v1

    iput v1, v0, Landroid/support/v7/widget/Toolbar$SavedState;->expandedMenuItemId:I

    .line 1039
    :cond_1d
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->isOverflowMenuShowing()Z

    move-result v1

    iput-boolean v1, v0, Landroid/support/v7/widget/Toolbar$SavedState;->isOverflowOpen:Z

    .line 1040
    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1079
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    .line 1080
    .local v0, "action":I
    if-nez v0, :cond_a

    .line 1081
    iput-boolean v4, p0, Landroid/support/v7/widget/Toolbar;->mEatingTouch:Z

    .line 1084
    :cond_a
    iget-boolean v2, p0, Landroid/support/v7/widget/Toolbar;->mEatingTouch:Z

    if-nez v2, :cond_18

    .line 1085
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 1086
    .local v1, "handled":Z
    if-nez v0, :cond_18

    if-nez v1, :cond_18

    .line 1087
    iput-boolean v3, p0, Landroid/support/v7/widget/Toolbar;->mEatingTouch:Z

    .line 1091
    .end local v1    # "handled":Z
    :cond_18
    if-eq v0, v3, :cond_1d

    const/4 v2, 0x3

    if-ne v0, v2, :cond_1f

    .line 1092
    :cond_1d
    iput-boolean v4, p0, Landroid/support/v7/widget/Toolbar;->mEatingTouch:Z

    .line 1095
    :cond_1f
    return v3
.end method

.method public setCollapsible(Z)V
    .registers 2
    .param p1, "collapsible"    # Z

    .prologue
    .line 1756
    iput-boolean p1, p0, Landroid/support/v7/widget/Toolbar;->mCollapsible:Z

    .line 1757
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->requestLayout()V

    .line 1758
    return-void
.end method

.method public setContentInsetsRelative(II)V
    .registers 4
    .param p1, "contentInsetStart"    # I
    .param p2, "contentInsetEnd"    # I

    .prologue
    .line 889
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mContentInsets:Landroid/support/v7/internal/widget/RtlSpacingHelper;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/internal/widget/RtlSpacingHelper;->setRelative(II)V

    .line 890
    return-void
.end method

.method public setLogo(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 324
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/Toolbar;->setLogo(Landroid/graphics/drawable/Drawable;)V

    .line 325
    return-void
.end method

.method public setLogo(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 440
    if-eqz p1, :cond_21

    .line 441
    invoke-direct {p0}, Landroid/support/v7/widget/Toolbar;->ensureLogoView()V

    .line 442
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_17

    .line 443
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    invoke-direct {p0, v0}, Landroid/support/v7/widget/Toolbar;->addSystemView(Landroid/view/View;)V

    .line 444
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    invoke-direct {p0, v0}, Landroid/support/v7/widget/Toolbar;->updateChildVisibilityForExpandedActionView(Landroid/view/View;)V

    .line 449
    :cond_17
    :goto_17
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    if-eqz v0, :cond_20

    .line 450
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 452
    :cond_20
    return-void

    .line 446
    :cond_21
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    if-eqz v0, :cond_17

    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 447
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/Toolbar;->removeView(Landroid/view/View;)V

    goto :goto_17
.end method

.method public setLogoDescription(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 474
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/Toolbar;->setLogoDescription(Ljava/lang/CharSequence;)V

    .line 475
    return-void
.end method

.method public setLogoDescription(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/CharSequence;

    .prologue
    .line 486
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 487
    invoke-direct {p0}, Landroid/support/v7/widget/Toolbar;->ensureLogoView()V

    .line 489
    :cond_9
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    if-eqz v0, :cond_12

    .line 490
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mLogoView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 492
    :cond_12
    return-void
.end method

.method public setMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/support/v7/widget/ActionMenuPresenter;)V
    .registers 8
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "outerPresenter"    # Landroid/support/v7/widget/ActionMenuPresenter;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 367
    if-nez p1, :cond_9

    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-nez v1, :cond_9

    .line 399
    :cond_8
    :goto_8
    return-void

    .line 371
    :cond_9
    invoke-direct {p0}, Landroid/support/v7/widget/Toolbar;->ensureMenuView()V

    .line 372
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v1}, Landroid/support/v7/widget/ActionMenuView;->peekMenu()Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-result-object v0

    .line 373
    .local v0, "oldMenu":Landroid/support/v7/internal/view/menu/MenuBuilder;
    if-eq v0, p1, :cond_8

    .line 377
    if-eqz v0, :cond_20

    .line 378
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mOuterActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->removeMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;)V

    .line 379
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->removeMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;)V

    .line 382
    :cond_20
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    if-nez v1, :cond_2b

    .line 383
    new-instance v1, Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    invoke-direct {v1, p0, v4}, Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;-><init>(Landroid/support/v7/widget/Toolbar;Landroid/support/v7/widget/Toolbar$1;)V

    iput-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    .line 386
    :cond_2b
    invoke-virtual {p2, v3}, Landroid/support/v7/widget/ActionMenuPresenter;->setExpandedActionViewsExclusive(Z)V

    .line 387
    if-eqz p1, :cond_4b

    .line 388
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mPopupContext:Landroid/content/Context;

    invoke-virtual {p1, p2, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->addMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;Landroid/content/Context;)V

    .line 389
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    iget-object v2, p0, Landroid/support/v7/widget/Toolbar;->mPopupContext:Landroid/content/Context;

    invoke-virtual {p1, v1, v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->addMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;Landroid/content/Context;)V

    .line 396
    :goto_3c
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    iget v2, p0, Landroid/support/v7/widget/Toolbar;->mPopupTheme:I

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/ActionMenuView;->setPopupTheme(I)V

    .line 397
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v1, p2}, Landroid/support/v7/widget/ActionMenuView;->setPresenter(Landroid/support/v7/widget/ActionMenuPresenter;)V

    .line 398
    iput-object p2, p0, Landroid/support/v7/widget/Toolbar;->mOuterActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    goto :goto_8

    .line 391
    :cond_4b
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mPopupContext:Landroid/content/Context;

    invoke-virtual {p2, v1, v4}, Landroid/support/v7/widget/ActionMenuPresenter;->initForMenu(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;)V

    .line 392
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    iget-object v2, p0, Landroid/support/v7/widget/Toolbar;->mPopupContext:Landroid/content/Context;

    invoke-virtual {v1, v2, v4}, Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;->initForMenu(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;)V

    .line 393
    invoke-virtual {p2, v3}, Landroid/support/v7/widget/ActionMenuPresenter;->updateMenuView(Z)V

    .line 394
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mExpandedMenuPresenter:Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/Toolbar$ExpandedActionViewMenuPresenter;->updateMenuView(Z)V

    goto :goto_3c
.end method

.method public setMenuCallbacks(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;)V
    .registers 3
    .param p1, "pcb"    # Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;
    .param p2, "mcb"    # Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;

    .prologue
    .line 1765
    iput-object p1, p0, Landroid/support/v7/widget/Toolbar;->mActionMenuPresenterCallback:Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    .line 1766
    iput-object p2, p0, Landroid/support/v7/widget/Toolbar;->mMenuBuilderCallback:Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;

    .line 1767
    return-void
.end method

.method public setNavigationContentDescription(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 718
    if-eqz p1, :cond_e

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    :goto_a
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    .line 719
    return-void

    .line 718
    :cond_e
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public setNavigationContentDescription(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/CharSequence;

    .prologue
    .line 730
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 731
    invoke-direct {p0}, Landroid/support/v7/widget/Toolbar;->ensureNavButtonView()V

    .line 733
    :cond_9
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    if-eqz v0, :cond_12

    .line 734
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 736
    :cond_12
    return-void
.end method

.method public setNavigationIcon(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 751
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 752
    return-void
.end method

.method public setNavigationIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 767
    if-eqz p1, :cond_21

    .line 768
    invoke-direct {p0}, Landroid/support/v7/widget/Toolbar;->ensureNavButtonView()V

    .line 769
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_17

    .line 770
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-direct {p0, v0}, Landroid/support/v7/widget/Toolbar;->addSystemView(Landroid/view/View;)V

    .line 771
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-direct {p0, v0}, Landroid/support/v7/widget/Toolbar;->updateChildVisibilityForExpandedActionView(Landroid/view/View;)V

    .line 776
    :cond_17
    :goto_17
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    if-eqz v0, :cond_20

    .line 777
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 779
    :cond_20
    return-void

    .line 773
    :cond_21
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    if-eqz v0, :cond_17

    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 774
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/Toolbar;->removeView(Landroid/view/View;)V

    goto :goto_17
.end method

.method public setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 801
    invoke-direct {p0}, Landroid/support/v7/widget/Toolbar;->ensureNavButtonView()V

    .line 802
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mNavButtonView:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 803
    return-void
.end method

.method public setOnMenuItemClickListener(Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;

    .prologue
    .line 869
    iput-object p1, p0, Landroid/support/v7/widget/Toolbar;->mOnMenuItemClickListener:Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;

    .line 870
    return-void
.end method

.method public setPopupTheme(I)V
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 288
    iget v0, p0, Landroid/support/v7/widget/Toolbar;->mPopupTheme:I

    if-eq v0, p1, :cond_e

    .line 289
    iput p1, p0, Landroid/support/v7/widget/Toolbar;->mPopupTheme:I

    .line 290
    if-nez p1, :cond_f

    .line 291
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/Toolbar;->mPopupContext:Landroid/content/Context;

    .line 296
    :cond_e
    :goto_e
    return-void

    .line 293
    :cond_f
    new-instance v0, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Landroid/support/v7/widget/Toolbar;->mPopupContext:Landroid/content/Context;

    goto :goto_e
.end method

.method public setSubtitle(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 614
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 615
    return-void
.end method

.method public setSubtitle(Ljava/lang/CharSequence;)V
    .registers 5
    .param p1, "subtitle"    # Ljava/lang/CharSequence;

    .prologue
    .line 625
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_55

    .line 626
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    if-nez v1, :cond_37

    .line 627
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 628
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    .line 629
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->setSingleLine()V

    .line 630
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 631
    iget v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextAppearance:I

    if-eqz v1, :cond_2c

    .line 632
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    iget v2, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextAppearance:I

    invoke-virtual {v1, v0, v2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 634
    :cond_2c
    iget v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextColor:I

    if-eqz v1, :cond_37

    .line 635
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    iget v2, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextColor:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 638
    .end local v0    # "context":Landroid/content/Context;
    :cond_37
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_49

    .line 639
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    invoke-direct {p0, v1}, Landroid/support/v7/widget/Toolbar;->addSystemView(Landroid/view/View;)V

    .line 640
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    invoke-direct {p0, v1}, Landroid/support/v7/widget/Toolbar;->updateChildVisibilityForExpandedActionView(Landroid/view/View;)V

    .line 645
    :cond_49
    :goto_49
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    if-eqz v1, :cond_52

    .line 646
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 648
    :cond_52
    iput-object p1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleText:Ljava/lang/CharSequence;

    .line 649
    return-void

    .line 642
    :cond_55
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    if-eqz v1, :cond_49

    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_49

    .line 643
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/Toolbar;->removeView(Landroid/view/View;)V

    goto :goto_49
.end method

.method public setSubtitleTextAppearance(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .prologue
    .line 667
    iput p2, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextAppearance:I

    .line 668
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_b

    .line 669
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 671
    :cond_b
    return-void
.end method

.method public setSubtitleTextColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 691
    iput p1, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextColor:I

    .line 692
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_b

    .line 693
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mSubtitleTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 695
    :cond_b
    return-void
.end method

.method public setTitle(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 559
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 560
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 5
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 571
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_55

    .line 572
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    if-nez v1, :cond_37

    .line 573
    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 574
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    .line 575
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->setSingleLine()V

    .line 576
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 577
    iget v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextAppearance:I

    if-eqz v1, :cond_2c

    .line 578
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    iget v2, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextAppearance:I

    invoke-virtual {v1, v0, v2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 580
    :cond_2c
    iget v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextColor:I

    if-eqz v1, :cond_37

    .line 581
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    iget v2, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextColor:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 584
    .end local v0    # "context":Landroid/content/Context;
    :cond_37
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_49

    .line 585
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    invoke-direct {p0, v1}, Landroid/support/v7/widget/Toolbar;->addSystemView(Landroid/view/View;)V

    .line 586
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    invoke-direct {p0, v1}, Landroid/support/v7/widget/Toolbar;->updateChildVisibilityForExpandedActionView(Landroid/view/View;)V

    .line 591
    :cond_49
    :goto_49
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    if-eqz v1, :cond_52

    .line 592
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 594
    :cond_52
    iput-object p1, p0, Landroid/support/v7/widget/Toolbar;->mTitleText:Ljava/lang/CharSequence;

    .line 595
    return-void

    .line 588
    :cond_55
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    if-eqz v1, :cond_49

    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_49

    .line 589
    iget-object v1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/Toolbar;->removeView(Landroid/view/View;)V

    goto :goto_49
.end method

.method public setTitleTextAppearance(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .prologue
    .line 656
    iput p2, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextAppearance:I

    .line 657
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_b

    .line 658
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 660
    :cond_b
    return-void
.end method

.method public setTitleTextColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 679
    iput p1, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextColor:I

    .line 680
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_b

    .line 681
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mTitleTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 683
    :cond_b
    return-void
.end method

.method public showOverflowMenu()Z
    .registers 2

    .prologue
    .line 353
    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/Toolbar;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuView;->showOverflowMenu()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method
