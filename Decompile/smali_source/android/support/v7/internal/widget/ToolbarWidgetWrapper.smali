.class public Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;
.super Ljava/lang/Object;
.source "ToolbarWidgetWrapper.java"

# interfaces
.implements Landroid/support/v7/internal/widget/DecorToolbar;


# instance fields
.field private mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

.field private mCustomView:Landroid/view/View;

.field private mDefaultNavigationContentDescription:I

.field private mDefaultNavigationIcon:Landroid/graphics/drawable/Drawable;

.field private mDisplayOpts:I

.field private mHomeDescription:Ljava/lang/CharSequence;

.field private mIcon:Landroid/graphics/drawable/Drawable;

.field private mLogo:Landroid/graphics/drawable/Drawable;

.field private mMenuPrepared:Z

.field private mNavIcon:Landroid/graphics/drawable/Drawable;

.field private mNavigationMode:I

.field private mSubtitle:Ljava/lang/CharSequence;

.field private mTabView:Landroid/view/View;

.field private final mTintManager:Landroid/support/v7/internal/widget/TintManager;

.field private mTitle:Ljava/lang/CharSequence;

.field private mTitleSet:Z

.field private mToolbar:Landroid/support/v7/widget/Toolbar;

.field private mWindowCallback:Landroid/view/Window$Callback;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/Toolbar;Z)V
    .registers 5
    .param p1, "toolbar"    # Landroid/support/v7/widget/Toolbar;
    .param p2, "style"    # Z

    .prologue
    .line 87
    sget v0, Landroid/support/v7/appcompat/R$string;->abc_action_bar_up_description:I

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_ic_ab_back_mtrl_am_alpha:I

    invoke-direct {p0, p1, p2, v0, v1}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;-><init>(Landroid/support/v7/widget/Toolbar;ZII)V

    .line 89
    return-void
.end method

.method public constructor <init>(Landroid/support/v7/widget/Toolbar;ZII)V
    .registers 27
    .param p1, "toolbar"    # Landroid/support/v7/widget/Toolbar;
    .param p2, "style"    # Z
    .param p3, "defaultNavigationContentDescription"    # I
    .param p4, "defaultNavigationIcon"    # I

    .prologue
    .line 92
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 80
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mNavigationMode:I

    .line 83
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDefaultNavigationContentDescription:I

    .line 93
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    .line 94
    invoke-virtual/range {p1 .. p1}, Landroid/support/v7/widget/Toolbar;->getTitle()Ljava/lang/CharSequence;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTitle:Ljava/lang/CharSequence;

    .line 95
    invoke-virtual/range {p1 .. p1}, Landroid/support/v7/widget/Toolbar;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mSubtitle:Ljava/lang/CharSequence;

    .line 96
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTitle:Ljava/lang/CharSequence;

    move-object/from16 v17, v0

    if-eqz v17, :cond_216

    const/16 v17, 0x1

    :goto_37
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTitleSet:Z

    .line 97
    invoke-virtual/range {p1 .. p1}, Landroid/support/v7/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mNavIcon:Landroid/graphics/drawable/Drawable;

    .line 99
    if-eqz p2, :cond_21a

    .line 100
    invoke-virtual/range {p1 .. p1}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v17

    const/16 v18, 0x0

    sget-object v19, Landroid/support/v7/appcompat/R$styleable;->ActionBar:[I

    sget v20, Landroid/support/v7/appcompat/R$attr;->actionBarStyle:I

    const/16 v21, 0x0

    invoke-static/range {v17 .. v21}, Landroid/support/v7/internal/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/internal/widget/TintTypedArray;

    move-result-object v3

    .line 103
    .local v3, "a":Landroid/support/v7/internal/widget/TintTypedArray;
    sget v17, Landroid/support/v7/appcompat/R$styleable;->ActionBar_title:I

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v15

    .line 104
    .local v15, "title":Ljava/lang/CharSequence;
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_6c

    .line 105
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setTitle(Ljava/lang/CharSequence;)V

    .line 108
    :cond_6c
    sget v17, Landroid/support/v7/appcompat/R$styleable;->ActionBar_subtitle:I

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v13

    .line 109
    .local v13, "subtitle":Ljava/lang/CharSequence;
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_7f

    .line 110
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 113
    :cond_7f
    sget v17, Landroid/support/v7/appcompat/R$styleable;->ActionBar_logo:I

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 114
    .local v9, "logo":Landroid/graphics/drawable/Drawable;
    if-eqz v9, :cond_8e

    .line 115
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setLogo(Landroid/graphics/drawable/Drawable;)V

    .line 118
    :cond_8e
    sget v17, Landroid/support/v7/appcompat/R$styleable;->ActionBar_icon:I

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 119
    .local v8, "icon":Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mNavIcon:Landroid/graphics/drawable/Drawable;

    move-object/from16 v17, v0

    if-nez v17, :cond_a5

    if-eqz v8, :cond_a5

    .line 120
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 123
    :cond_a5
    sget v17, Landroid/support/v7/appcompat/R$styleable;->ActionBar_homeAsUpIndicator:I

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    .line 124
    .local v11, "navIcon":Landroid/graphics/drawable/Drawable;
    if-eqz v11, :cond_b4

    .line 125
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 128
    :cond_b4
    sget v17, Landroid/support/v7/appcompat/R$styleable;->ActionBar_displayOptions:I

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getInt(II)I

    move-result v17

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setDisplayOptions(I)V

    .line 130
    sget v17, Landroid/support/v7/appcompat/R$styleable;->ActionBar_customNavigationLayout:I

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getResourceId(II)I

    move-result v6

    .line 132
    .local v6, "customNavId":I
    if-eqz v6, :cond_10b

    .line 133
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v6, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setCustomView(Landroid/view/View;)V

    .line 135
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    move/from16 v17, v0

    or-int/lit8 v17, v17, 0x10

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setDisplayOptions(I)V

    .line 138
    :cond_10b
    sget v17, Landroid/support/v7/appcompat/R$styleable;->ActionBar_height:I

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getLayoutDimension(II)I

    move-result v7

    .line 139
    .local v7, "height":I
    if-lez v7, :cond_130

    .line 140
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/support/v7/widget/Toolbar;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    .line 141
    .local v10, "lp":Landroid/view/ViewGroup$LayoutParams;
    iput v7, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 142
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Landroid/support/v7/widget/Toolbar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    .end local v10    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_130
    sget v17, Landroid/support/v7/appcompat/R$styleable;->ActionBar_contentInsetStart:I

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getDimensionPixelOffset(II)I

    move-result v5

    .line 147
    .local v5, "contentInsetStart":I
    sget v17, Landroid/support/v7/appcompat/R$styleable;->ActionBar_contentInsetEnd:I

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    .line 149
    .local v4, "contentInsetEnd":I
    if-gez v5, :cond_14c

    if-ltz v4, :cond_165

    .line 150
    :cond_14c
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v18

    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v19

    invoke-virtual/range {v17 .. v19}, Landroid/support/v7/widget/Toolbar;->setContentInsetsRelative(II)V

    .line 154
    :cond_165
    sget v17, Landroid/support/v7/appcompat/R$styleable;->ActionBar_titleTextStyle:I

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getResourceId(II)I

    move-result v16

    .line 155
    .local v16, "titleTextStyle":I
    if-eqz v16, :cond_18c

    .line 156
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/Toolbar;->setTitleTextAppearance(Landroid/content/Context;I)V

    .line 159
    :cond_18c
    sget v17, Landroid/support/v7/appcompat/R$styleable;->ActionBar_subtitleTextStyle:I

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getResourceId(II)I

    move-result v14

    .line 161
    .local v14, "subtitleTextStyle":I
    if-eqz v14, :cond_1b1

    .line 162
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v14}, Landroid/support/v7/widget/Toolbar;->setSubtitleTextAppearance(Landroid/content/Context;I)V

    .line 165
    :cond_1b1
    sget v17, Landroid/support/v7/appcompat/R$styleable;->ActionBar_popupTheme:I

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->getResourceId(II)I

    move-result v12

    .line 166
    .local v12, "popupTheme":I
    if-eqz v12, :cond_1ca

    .line 167
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Landroid/support/v7/widget/Toolbar;->setPopupTheme(I)V

    .line 170
    :cond_1ca
    invoke-virtual {v3}, Landroid/support/v7/internal/widget/TintTypedArray;->recycle()V

    .line 172
    invoke-virtual {v3}, Landroid/support/v7/internal/widget/TintTypedArray;->getTintManager()Landroid/support/v7/internal/widget/TintManager;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    .line 179
    .end local v3    # "a":Landroid/support/v7/internal/widget/TintTypedArray;
    .end local v4    # "contentInsetEnd":I
    .end local v5    # "contentInsetStart":I
    .end local v6    # "customNavId":I
    .end local v7    # "height":I
    .end local v8    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v9    # "logo":Landroid/graphics/drawable/Drawable;
    .end local v11    # "navIcon":Landroid/graphics/drawable/Drawable;
    .end local v12    # "popupTheme":I
    .end local v13    # "subtitle":Ljava/lang/CharSequence;
    .end local v14    # "subtitleTextStyle":I
    .end local v15    # "title":Ljava/lang/CharSequence;
    .end local v16    # "titleTextStyle":I
    :goto_1d7
    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setDefaultNavigationContentDescription(I)V

    .line 180
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/support/v7/widget/Toolbar;->getNavigationContentDescription()Ljava/lang/CharSequence;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mHomeDescription:Ljava/lang/CharSequence;

    .line 182
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move/from16 v1, p4

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setDefaultNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 184
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    move-object/from16 v17, v0

    new-instance v18, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper$1;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper$1;-><init>(Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;)V

    invoke-virtual/range {v17 .. v18}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 194
    return-void

    .line 96
    :cond_216
    const/16 v17, 0x0

    goto/16 :goto_37

    .line 174
    :cond_21a
    invoke-direct/range {p0 .. p0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->detectDisplayOptions()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    .line 176
    invoke-virtual/range {p1 .. p1}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Landroid/support/v7/internal/widget/TintManager;->get(Landroid/content/Context;)Landroid/support/v7/internal/widget/TintManager;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    goto :goto_1d7
.end method

.method static synthetic access$000(Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;)Landroid/support/v7/widget/Toolbar;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;

    .prologue
    .line 54
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    return-object v0
.end method

.method static synthetic access$100(Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;

    .prologue
    .line 54
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$200(Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;)Landroid/view/Window$Callback;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;

    .prologue
    .line 54
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mWindowCallback:Landroid/view/Window$Callback;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;

    .prologue
    .line 54
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mMenuPrepared:Z

    return v0
.end method

.method private detectDisplayOptions()I
    .registers 3

    .prologue
    .line 225
    const/16 v0, 0xb

    .line 227
    .local v0, "opts":I
    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_c

    .line 228
    or-int/lit8 v0, v0, 0x4

    .line 230
    :cond_c
    return v0
.end method

.method private setTitleInt(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 283
    iput-object p1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTitle:Ljava/lang/CharSequence;

    .line 284
    iget v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_d

    .line 285
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 287
    :cond_d
    return-void
.end method

.method private updateHomeAccessibility()V
    .registers 3

    .prologue
    .line 654
    iget v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_15

    .line 655
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mHomeDescription:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 656
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDefaultNavigationContentDescription:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationContentDescription(I)V

    .line 661
    :cond_15
    :goto_15
    return-void

    .line 658
    :cond_16
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mHomeDescription:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_15
.end method

.method private updateNavigationIcon()V
    .registers 3

    .prologue
    .line 664
    iget v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_11

    .line 665
    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mNavIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_12

    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mNavIcon:Landroid/graphics/drawable/Drawable;

    :goto_e
    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 667
    :cond_11
    return-void

    .line 665
    :cond_12
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDefaultNavigationIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_e
.end method

.method private updateToolbarLogo()V
    .registers 3

    .prologue
    .line 366
    const/4 v0, 0x0

    .line 367
    .local v0, "logo":Landroid/graphics/drawable/Drawable;
    iget v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_13

    .line 368
    iget v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1c

    .line 369
    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mLogo:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_19

    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mLogo:Landroid/graphics/drawable/Drawable;

    .line 374
    :cond_13
    :goto_13
    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setLogo(Landroid/graphics/drawable/Drawable;)V

    .line 375
    return-void

    .line 369
    :cond_19
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_13

    .line 371
    :cond_1c
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_13
.end method


# virtual methods
.method public animateToVisibility(I)V
    .registers 4
    .param p1, "visibility"    # I

    .prologue
    .line 602
    const/16 v0, 0x8

    if-ne p1, v0, :cond_18

    .line 603
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper$2;

    invoke-direct {v1, p0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper$2;-><init>(Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 627
    :cond_17
    :goto_17
    return-void

    .line 618
    :cond_18
    if-nez p1, :cond_17

    .line 619
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper$3;

    invoke-direct {v1, p0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper$3;-><init>(Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    goto :goto_17
.end method

.method public canShowOverflowMenu()Z
    .registers 2

    .prologue
    .line 379
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->canShowOverflowMenu()Z

    move-result v0

    return v0
.end method

.method public collapseActionView()V
    .registers 2

    .prologue
    .line 255
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->collapseActionView()V

    .line 256
    return-void
.end method

.method public dismissPopupMenus()V
    .registers 2

    .prologue
    .line 419
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->dismissPopupMenus()V

    .line 420
    return-void
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 240
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayOptions()I
    .registers 2

    .prologue
    .line 424
    iget v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    return v0
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 687
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getHeight()I

    move-result v0

    return v0
.end method

.method public getMenu()Landroid/view/Menu;
    .registers 2

    .prologue
    .line 708
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    return-object v0
.end method

.method public getNavigationMode()I
    .registers 2

    .prologue
    .line 504
    iget v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mNavigationMode:I

    return v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 273
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getViewGroup()Landroid/view/ViewGroup;
    .registers 2

    .prologue
    .line 235
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    return-object v0
.end method

.method public getVisibility()I
    .registers 2

    .prologue
    .line 697
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getVisibility()I

    move-result v0

    return v0
.end method

.method public hasExpandedActionView()Z
    .registers 2

    .prologue
    .line 250
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->hasExpandedActionView()Z

    move-result v0

    return v0
.end method

.method public hideOverflowMenu()Z
    .registers 2

    .prologue
    .line 399
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->hideOverflowMenu()Z

    move-result v0

    return v0
.end method

.method public initIndeterminateProgress()V
    .registers 3

    .prologue
    .line 309
    const-string v0, "ToolbarWidgetWrapper"

    const-string v1, "Progress display unsupported"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    return-void
.end method

.method public initProgress()V
    .registers 3

    .prologue
    .line 304
    const-string v0, "ToolbarWidgetWrapper"

    const-string v1, "Progress display unsupported"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    return-void
.end method

.method public isOverflowMenuShowPending()Z
    .registers 2

    .prologue
    .line 389
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->isOverflowMenuShowPending()Z

    move-result v0

    return v0
.end method

.method public isOverflowMenuShowing()Z
    .registers 2

    .prologue
    .line 384
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->isOverflowMenuShowing()Z

    move-result v0

    return v0
.end method

.method public isSplit()Z
    .registers 2

    .prologue
    .line 245
    const/4 v0, 0x0

    return v0
.end method

.method public setCollapsible(Z)V
    .registers 3
    .param p1, "collapsible"    # Z

    .prologue
    .line 494
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->setCollapsible(Z)V

    .line 495
    return-void
.end method

.method public setCustomView(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 586
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_11

    iget v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_11

    .line 587
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->removeView(Landroid/view/View;)V

    .line 589
    :cond_11
    iput-object p1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    .line 590
    if-eqz p1, :cond_22

    iget v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_22

    .line 591
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;)V

    .line 593
    :cond_22
    return-void
.end method

.method public setDefaultNavigationContentDescription(I)V
    .registers 3
    .param p1, "defaultNavigationContentDescription"    # I

    .prologue
    .line 207
    iget v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDefaultNavigationContentDescription:I

    if-ne p1, v0, :cond_5

    .line 214
    :cond_4
    :goto_4
    return-void

    .line 210
    :cond_5
    iput p1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDefaultNavigationContentDescription:I

    .line 211
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getNavigationContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 212
    iget v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDefaultNavigationContentDescription:I

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setNavigationContentDescription(I)V

    goto :goto_4
.end method

.method public setDefaultNavigationIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "defaultNavigationIcon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 218
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDefaultNavigationIcon:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_9

    .line 219
    iput-object p1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDefaultNavigationIcon:Landroid/graphics/drawable/Drawable;

    .line 220
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->updateNavigationIcon()V

    .line 222
    :cond_9
    return-void
.end method

.method public setDisplayOptions(I)V
    .registers 6
    .param p1, "newOpts"    # I

    .prologue
    const/4 v3, 0x0

    .line 429
    iget v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    .line 430
    .local v1, "oldOpts":I
    xor-int v0, v1, p1

    .line 431
    .local v0, "changed":I
    iput p1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    .line 432
    if-eqz v0, :cond_47

    .line 433
    and-int/lit8 v2, v0, 0x4

    if-eqz v2, :cond_17

    .line 434
    and-int/lit8 v2, p1, 0x4

    if-eqz v2, :cond_48

    .line 435
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->updateNavigationIcon()V

    .line 436
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->updateHomeAccessibility()V

    .line 442
    :cond_17
    :goto_17
    and-int/lit8 v2, v0, 0x3

    if-eqz v2, :cond_1e

    .line 443
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->updateToolbarLogo()V

    .line 446
    :cond_1e
    and-int/lit8 v2, v0, 0x8

    if-eqz v2, :cond_34

    .line 447
    and-int/lit8 v2, p1, 0x8

    if-eqz v2, :cond_4e

    .line 448
    iget-object v2, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v3, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 449
    iget-object v2, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v3, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mSubtitle:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 456
    :cond_34
    :goto_34
    and-int/lit8 v2, v0, 0x10

    if-eqz v2, :cond_47

    iget-object v2, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    if-eqz v2, :cond_47

    .line 457
    and-int/lit8 v2, p1, 0x10

    if-eqz v2, :cond_59

    .line 458
    iget-object v2, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v3, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;)V

    .line 464
    :cond_47
    :goto_47
    return-void

    .line 438
    :cond_48
    iget-object v2, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    goto :goto_17

    .line 451
    :cond_4e
    iget-object v2, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 452
    iget-object v2, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    goto :goto_34

    .line 460
    :cond_59
    iget-object v2, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v3, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->removeView(Landroid/view/View;)V

    goto :goto_47
.end method

.method public setEmbeddedTabView(Landroid/support/v7/internal/widget/ScrollingTabContainerView;)V
    .registers 7
    .param p1, "tabView"    # Landroid/support/v7/internal/widget/ScrollingTabContainerView;

    .prologue
    const/4 v4, -0x2

    .line 468
    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    if-eqz v1, :cond_16

    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-ne v1, v2, :cond_16

    .line 469
    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v2, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->removeView(Landroid/view/View;)V

    .line 471
    :cond_16
    iput-object p1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    .line 472
    if-eqz p1, :cond_3c

    iget v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mNavigationMode:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_3c

    .line 473
    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v2, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;I)V

    .line 474
    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar$LayoutParams;

    .line 475
    .local v0, "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    iput v4, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->width:I

    .line 476
    iput v4, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->height:I

    .line 477
    const v1, 0x800053

    iput v1, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->gravity:I

    .line 478
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/support/v7/internal/widget/ScrollingTabContainerView;->setAllowCollapse(Z)V

    .line 480
    .end local v0    # "lp":Landroid/support/v7/widget/Toolbar$LayoutParams;
    :cond_3c
    return-void
.end method

.method public setHomeButtonEnabled(Z)V
    .registers 2
    .param p1, "enable"    # Z

    .prologue
    .line 500
    return-void
.end method

.method public setIcon(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 345
    if-eqz p1, :cond_c

    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_8
    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 346
    return-void

    .line 345
    :cond_c
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 350
    iput-object p1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 351
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->updateToolbarLogo()V

    .line 352
    return-void
.end method

.method public setLogo(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 356
    if-eqz p1, :cond_c

    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_8
    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setLogo(Landroid/graphics/drawable/Drawable;)V

    .line 357
    return-void

    .line 356
    :cond_c
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public setLogo(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 361
    iput-object p1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mLogo:Landroid/graphics/drawable/Drawable;

    .line 362
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->updateToolbarLogo()V

    .line 363
    return-void
.end method

.method public setMenu(Landroid/view/Menu;Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)V
    .registers 5
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "cb"    # Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    .prologue
    .line 409
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-nez v0, :cond_18

    .line 410
    new-instance v0, Landroid/support/v7/widget/ActionMenuPresenter;

    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/ActionMenuPresenter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    .line 411
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    sget v1, Landroid/support/v7/appcompat/R$id;->action_menu_presenter:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ActionMenuPresenter;->setId(I)V

    .line 413
    :cond_18
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0, p2}, Landroid/support/v7/widget/ActionMenuPresenter;->setCallback(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)V

    .line 414
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    check-cast p1, Landroid/support/v7/internal/view/menu/MenuBuilder;

    .end local p1    # "menu":Landroid/view/Menu;
    iget-object v1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0, p1, v1}, Landroid/support/v7/widget/Toolbar;->setMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/support/v7/widget/ActionMenuPresenter;)V

    .line 415
    return-void
.end method

.method public setMenuCallbacks(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;)V
    .registers 4
    .param p1, "actionMenuPresenterCallback"    # Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;
    .param p2, "menuBuilderCallback"    # Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;

    .prologue
    .line 703
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/Toolbar;->setMenuCallbacks(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;)V

    .line 704
    return-void
.end method

.method public setMenuPrepared()V
    .registers 2

    .prologue
    .line 404
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mMenuPrepared:Z

    .line 405
    return-void
.end method

.method public setNavigationContentDescription(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 650
    if-nez p1, :cond_7

    const/4 v0, 0x0

    :goto_3
    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    .line 651
    return-void

    .line 650
    :cond_7
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public setNavigationContentDescription(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "description"    # Ljava/lang/CharSequence;

    .prologue
    .line 644
    iput-object p1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mHomeDescription:Ljava/lang/CharSequence;

    .line 645
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->updateHomeAccessibility()V

    .line 646
    return-void
.end method

.method public setNavigationIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 631
    iput-object p1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mNavIcon:Landroid/graphics/drawable/Drawable;

    .line 632
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->updateNavigationIcon()V

    .line 633
    return-void
.end method

.method public setSubtitle(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "subtitle"    # Ljava/lang/CharSequence;

    .prologue
    .line 296
    iput-object p1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mSubtitle:Ljava/lang/CharSequence;

    .line 297
    iget v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_d

    .line 298
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 300
    :cond_d
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 278
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTitleSet:Z

    .line 279
    invoke-direct {p0, p1}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setTitleInt(Ljava/lang/CharSequence;)V

    .line 280
    return-void
.end method

.method public setVisibility(I)V
    .registers 3
    .param p1, "visible"    # I

    .prologue
    .line 692
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 693
    return-void
.end method

.method public setWindowCallback(Landroid/view/Window$Callback;)V
    .registers 2
    .param p1, "cb"    # Landroid/view/Window$Callback;

    .prologue
    .line 260
    iput-object p1, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mWindowCallback:Landroid/view/Window$Callback;

    .line 261
    return-void
.end method

.method public setWindowTitle(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 266
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mTitleSet:Z

    if-nez v0, :cond_7

    .line 267
    invoke-direct {p0, p1}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->setTitleInt(Ljava/lang/CharSequence;)V

    .line 269
    :cond_7
    return-void
.end method

.method public showOverflowMenu()Z
    .registers 2

    .prologue
    .line 394
    iget-object v0, p0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->showOverflowMenu()Z

    move-result v0

    return v0
.end method
