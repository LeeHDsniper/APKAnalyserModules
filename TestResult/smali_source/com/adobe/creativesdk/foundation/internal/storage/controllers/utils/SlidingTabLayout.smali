.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;
.super Landroid/widget/HorizontalScrollView;
.source "SlidingTabLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$1;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabClickListener;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;
    }
.end annotation


# instance fields
.field private mContentDescriptions:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mDistributeEvenly:Z

.field private final mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

.field private mTabViewLayoutId:I

.field private mTabViewTextViewId:I

.field private mTitleOffset:I

.field private mViewPager:Landroid/support/v4/view/ViewPager;

.field private mViewPagerPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 71
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 75
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 76
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 79
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 65
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mContentDescriptions:Landroid/util/SparseArray;

    .line 82
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->setHorizontalScrollBarEnabled(Z)V

    .line 84
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->setFillViewport(Z)V

    .line 86
    const/high16 v0, 0x41c00000

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTitleOffset:I

    .line 88
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    invoke-direct {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    .line 89
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->addView(Landroid/view/View;II)V

    .line 90
    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;II)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->scrollToTab(II)V

    return-void
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPagerPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Landroid/support/v4/view/ViewPager;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPager:Landroid/support/v4/view/ViewPager;

    return-object v0
.end method

.method private populateTabStrip()V
    .registers 15

    .prologue
    .line 177
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v10}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    .line 178
    .local v0, "adapter":Landroid/support/v4/view/PagerAdapter;
    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabClickListener;

    const/4 v10, 0x0

    invoke-direct {v6, p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabClickListener;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$1;)V

    .line 181
    .local v6, "tabClickListener":Landroid/view/View$OnClickListener;
    const/4 v5, 0x0

    .line 182
    .local v5, "sum":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_e
    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v10

    if-ge v3, v10, :cond_20

    .line 183
    invoke-virtual {v0, v3}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v10

    invoke-interface {v10}, Ljava/lang/CharSequence;->length()I

    move-result v10

    add-int/2addr v5, v10

    .line 182
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 185
    :cond_20
    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v10

    div-int v1, v5, v10

    .line 188
    .local v1, "avg":I
    const/4 v3, 0x0

    :goto_27
    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v10

    if-ge v3, v10, :cond_cd

    .line 189
    const/4 v8, 0x0

    .line 190
    .local v8, "tabView":Landroid/view/View;
    const/4 v7, 0x0

    .line 192
    .local v7, "tabTitleView":Landroid/widget/TextView;
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabViewLayoutId:I

    if-eqz v10, :cond_4c

    .line 194
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-static {v10}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v10

    iget v11, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabViewLayoutId:I

    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    const/4 v13, 0x0

    invoke-virtual {v10, v11, v12, v13}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    .line 196
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabViewTextViewId:I

    invoke-virtual {v8, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .end local v7    # "tabTitleView":Landroid/widget/TextView;
    check-cast v7, Landroid/widget/TextView;

    .line 199
    .restart local v7    # "tabTitleView":Landroid/widget/TextView;
    :cond_4c
    if-nez v8, :cond_56

    .line 200
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->createDefaultTabView(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object v8

    .line 203
    :cond_56
    if-nez v7, :cond_63

    const-class v10, Landroid/widget/TextView;

    invoke-virtual {v10, v8}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_63

    move-object v7, v8

    .line 204
    check-cast v7, Landroid/widget/TextView;

    .line 207
    :cond_63
    invoke-virtual {v0, v3}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    const-string v10, "#a3aeb7"

    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 211
    invoke-virtual {v8, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 212
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mContentDescriptions:Landroid/util/SparseArray;

    const/4 v11, 0x0

    invoke-virtual {v10, v3, v11}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 213
    .local v2, "desc":Ljava/lang/String;
    if-eqz v2, :cond_84

    .line 214
    invoke-virtual {v8, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 217
    :cond_84
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 218
    .local v4, "lp":Landroid/widget/LinearLayout$LayoutParams;
    iget-boolean v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mDistributeEvenly:Z

    if-eqz v10, :cond_b3

    .line 219
    const/4 v10, 0x0

    iput v10, v4, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 220
    const/high16 v10, 0x3f800000

    iput v10, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 235
    :goto_95
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    invoke-virtual {v10, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->addView(Landroid/view/View;)V

    .line 236
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v10}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v10

    if-ne v3, v10, :cond_af

    .line 237
    const-string v10, "#2098f5"

    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 238
    const/4 v10, 0x1

    invoke-virtual {v8, v10}, Landroid/view/View;->setSelected(Z)V

    .line 188
    :cond_af
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_27

    .line 224
    :cond_b3
    invoke-virtual {v0, v3}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v10

    invoke-interface {v10}, Ljava/lang/CharSequence;->length()I

    move-result v9

    .line 225
    .local v9, "textLen":I
    if-ge v9, v1, :cond_c5

    .line 227
    const/4 v10, 0x0

    iput v10, v4, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 228
    const/high16 v10, 0x3f800000

    iput v10, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    goto :goto_95

    .line 230
    :cond_c5
    const/4 v10, 0x0

    iput v10, v4, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 231
    const/high16 v10, 0x40000000

    iput v10, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    goto :goto_95

    .line 241
    .end local v2    # "desc":Ljava/lang/String;
    .end local v4    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    .end local v7    # "tabTitleView":Landroid/widget/TextView;
    .end local v8    # "tabView":Landroid/view/View;
    .end local v9    # "textLen":I
    :cond_cd
    return-void
.end method

.method private scrollToTab(II)V
    .registers 7
    .param p1, "tabIndex"    # I
    .param p2, "positionOffset"    # I

    .prologue
    .line 306
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildCount()I

    move-result v1

    .line 307
    .local v1, "tabStripChildCount":I
    if-eqz v1, :cond_c

    if-ltz p1, :cond_c

    if-lt p1, v1, :cond_d

    .line 322
    :cond_c
    :goto_c
    return-void

    .line 311
    :cond_d
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    invoke-virtual {v3, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 312
    .local v0, "selectedChild":Landroid/view/View;
    if-eqz v0, :cond_c

    .line 313
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v3

    add-int v2, v3, p2

    .line 315
    .local v2, "targetScrollX":I
    if-gtz p1, :cond_1f

    if-lez p2, :cond_22

    .line 317
    :cond_1f
    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTitleOffset:I

    sub-int/2addr v2, v3

    .line 320
    :cond_22
    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->scrollTo(II)V

    goto :goto_c
.end method


# virtual methods
.method protected createDefaultTabView(Landroid/content/Context;)Landroid/widget/TextView;
    .registers 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x1

    const/4 v5, -0x2

    .line 157
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 158
    .local v2, "textView":Landroid/widget/TextView;
    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 159
    const/4 v3, 0x2

    const/high16 v4, 0x41400000

    invoke-virtual {v2, v3, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 160
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 161
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 164
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 165
    .local v0, "outValue":Landroid/util/TypedValue;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    const v4, 0x101030e

    invoke-virtual {v3, v4, v0, v6}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 167
    iget v3, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 168
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 170
    const/high16 v3, 0x41800000

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v3, v4

    float-to-int v1, v3

    .line 171
    .local v1, "padding":I
    invoke-virtual {v2, v1, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 173
    return-object v2
.end method

.method protected onAttachedToWindow()V
    .registers 3

    .prologue
    .line 298
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onAttachedToWindow()V

    .line 300
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPager:Landroid/support/v4/view/ViewPager;

    if-eqz v0, :cond_11

    .line 301
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->scrollToTab(II)V

    .line 303
    :cond_11
    return-void
.end method

.method public setCustomTabColorizer(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;)V
    .registers 3
    .param p1, "tabColorizer"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;

    .prologue
    .line 100
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->setCustomTabColorizer(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;)V

    .line 101
    return-void
.end method

.method public setCustomTabView(II)V
    .registers 4
    .param p1, "layoutResId"    # I
    .param p2, "textViewId"    # I

    .prologue
    .line 133
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabViewLayoutId:I

    .line 134
    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabViewTextViewId:I

    .line 135
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->setCustomLayoutIds(II)V

    .line 136
    return-void
.end method

.method public setDistributeEvenly(Z)V
    .registers 2
    .param p1, "distributeEvenly"    # Z

    .prologue
    .line 104
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mDistributeEvenly:Z

    .line 105
    return-void
.end method

.method public setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .prologue
    .line 123
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPagerPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 124
    return-void
.end method

.method public varargs setSelectedIndicatorColors([I)V
    .registers 3
    .param p1, "colors"    # [I

    .prologue
    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->setSelectedIndicatorColors([I)V

    .line 113
    return-void
.end method

.method public setViewPager(Landroid/support/v4/view/ViewPager;)V
    .registers 4
    .param p1, "viewPager"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 143
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->removeAllViews()V

    .line 145
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 146
    if-eqz p1, :cond_15

    .line 147
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$1;)V

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 148
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->populateTabStrip()V

    .line 150
    :cond_15
    return-void
.end method
