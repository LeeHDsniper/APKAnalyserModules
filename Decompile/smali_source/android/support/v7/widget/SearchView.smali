.class public Landroid/support/v7/widget/SearchView;
.super Landroid/support/v7/widget/LinearLayoutCompat;
.source "SearchView.java"

# interfaces
.implements Landroid/support/v7/view/CollapsibleActionView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/SearchView$AutoCompleteTextViewReflector;,
        Landroid/support/v7/widget/SearchView$SearchAutoComplete;,
        Landroid/support/v7/widget/SearchView$OnSuggestionListener;,
        Landroid/support/v7/widget/SearchView$OnCloseListener;,
        Landroid/support/v7/widget/SearchView$OnQueryTextListener;
    }
.end annotation


# static fields
.field static final HIDDEN_METHOD_INVOKER:Landroid/support/v7/widget/SearchView$AutoCompleteTextViewReflector;

.field private static final IS_AT_LEAST_FROYO:Z


# instance fields
.field private mAppSearchData:Landroid/os/Bundle;

.field private mClearingFocus:Z

.field private final mCloseButton:Landroid/widget/ImageView;

.field private final mCollapsedIcon:Landroid/widget/ImageView;

.field private mCollapsedImeOptions:I

.field private final mDefaultQueryHint:Ljava/lang/CharSequence;

.field private mExpandedInActionView:Z

.field private final mGoButton:Landroid/widget/ImageView;

.field private mIconified:Z

.field private mIconifiedByDefault:Z

.field private mMaxWidth:I

.field private mOnCloseListener:Landroid/support/v7/widget/SearchView$OnCloseListener;

.field private mOnQueryChangeListener:Landroid/support/v7/widget/SearchView$OnQueryTextListener;

.field private mOnQueryTextFocusChangeListener:Landroid/view/View$OnFocusChangeListener;

.field private mOnSearchClickListener:Landroid/view/View$OnClickListener;

.field private mOnSuggestionListener:Landroid/support/v7/widget/SearchView$OnSuggestionListener;

.field private final mOutsideDrawablesCache:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/Drawable$ConstantState;",
            ">;"
        }
    .end annotation
.end field

.field private mQueryHint:Ljava/lang/CharSequence;

.field private mQueryRefinement:Z

.field private mReleaseCursorRunnable:Ljava/lang/Runnable;

.field private final mSearchButton:Landroid/widget/ImageView;

.field private final mSearchEditFrame:Landroid/view/View;

.field private final mSearchHintIcon:Landroid/graphics/drawable/Drawable;

.field private final mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

.field private mSearchable:Landroid/app/SearchableInfo;

.field private mShowImeRunnable:Ljava/lang/Runnable;

.field private final mSubmitArea:Landroid/view/View;

.field private mSubmitButtonEnabled:Z

.field private final mSuggestionCommitIconResId:I

.field private final mSuggestionRowLayout:I

.field private mSuggestionsAdapter:Landroid/support/v4/widget/CursorAdapter;

.field private final mUpdateDrawableStateRunnable:Ljava/lang/Runnable;

.field private mUserQuery:Ljava/lang/CharSequence;

.field private final mVoiceAppSearchIntent:Landroid/content/Intent;

.field private final mVoiceButton:Landroid/widget/ImageView;

.field private mVoiceButtonEnabled:Z

.field private final mVoiceWebSearchIntent:Landroid/content/Intent;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 109
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_11

    const/4 v0, 0x1

    :goto_7
    sput-boolean v0, Landroid/support/v7/widget/SearchView;->IS_AT_LEAST_FROYO:Z

    .line 167
    new-instance v0, Landroid/support/v7/widget/SearchView$AutoCompleteTextViewReflector;

    invoke-direct {v0}, Landroid/support/v7/widget/SearchView$AutoCompleteTextViewReflector;-><init>()V

    sput-object v0, Landroid/support/v7/widget/SearchView;->HIDDEN_METHOD_INVOKER:Landroid/support/v7/widget/SearchView$AutoCompleteTextViewReflector;

    return-void

    .line 109
    :cond_11
    const/4 v0, 0x0

    goto :goto_7
.end method

.method static synthetic access$2100(Landroid/support/v7/widget/SearchView;Z)V
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/SearchView;
    .param p1, "x1"    # Z

    .prologue
    .line 104
    invoke-direct {p0, p1}, Landroid/support/v7/widget/SearchView;->setImeVisibility(Z)V

    return-void
.end method

.method private createIntent(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Landroid/content/Intent;
    .registers 10
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "data"    # Landroid/net/Uri;
    .param p3, "extraData"    # Ljava/lang/String;
    .param p4, "query"    # Ljava/lang/String;
    .param p5, "actionKey"    # I
    .param p6, "actionMsg"    # Ljava/lang/String;

    .prologue
    .line 1434
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1435
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1439
    if-eqz p2, :cond_f

    .line 1440
    invoke-virtual {v0, p2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1442
    :cond_f
    const-string v1, "user_query"

    iget-object v2, p0, Landroid/support/v7/widget/SearchView;->mUserQuery:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 1443
    if-eqz p4, :cond_1d

    .line 1444
    const-string v1, "query"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1446
    :cond_1d
    if-eqz p3, :cond_24

    .line 1447
    const-string v1, "intent_extra_data_key"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1449
    :cond_24
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mAppSearchData:Landroid/os/Bundle;

    if-eqz v1, :cond_2f

    .line 1450
    const-string v1, "app_data"

    iget-object v2, p0, Landroid/support/v7/widget/SearchView;->mAppSearchData:Landroid/os/Bundle;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 1452
    :cond_2f
    if-eqz p5, :cond_3b

    .line 1453
    const-string v1, "action_key"

    invoke-virtual {v0, v1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1454
    const-string v1, "action_msg"

    invoke-virtual {v0, v1, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1456
    :cond_3b
    sget-boolean v1, Landroid/support/v7/widget/SearchView;->IS_AT_LEAST_FROYO:Z

    if-eqz v1, :cond_48

    .line 1457
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    invoke-virtual {v1}, Landroid/app/SearchableInfo;->getSearchActivity()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1459
    :cond_48
    return-object v0
.end method

.method private dismissSuggestions()V
    .registers 2

    .prologue
    .line 1163
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->dismissDropDown()V

    .line 1164
    return-void
.end method

.method private forceSuggestionQuery()V
    .registers 3

    .prologue
    .line 1599
    sget-object v0, Landroid/support/v7/widget/SearchView;->HIDDEN_METHOD_INVOKER:Landroid/support/v7/widget/SearchView$AutoCompleteTextViewReflector;

    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SearchView$AutoCompleteTextViewReflector;->doBeforeTextChanged(Landroid/widget/AutoCompleteTextView;)V

    .line 1600
    sget-object v0, Landroid/support/v7/widget/SearchView;->HIDDEN_METHOD_INVOKER:Landroid/support/v7/widget/SearchView$AutoCompleteTextViewReflector;

    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SearchView$AutoCompleteTextViewReflector;->doAfterTextChanged(Landroid/widget/AutoCompleteTextView;)V

    .line 1601
    return-void
.end method

.method private getDecoratedHint(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 9
    .param p1, "hintText"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v6, 0x0

    .line 1049
    iget-boolean v2, p0, Landroid/support/v7/widget/SearchView;->mIconifiedByDefault:Z

    if-eqz v2, :cond_9

    iget-object v2, p0, Landroid/support/v7/widget/SearchView;->mSearchHintIcon:Landroid/graphics/drawable/Drawable;

    if-nez v2, :cond_b

    :cond_9
    move-object v0, p1

    .line 1059
    :goto_a
    return-object v0

    .line 1053
    :cond_b
    iget-object v2, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v2}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->getTextSize()F

    move-result v2

    float-to-double v2, v2

    const-wide/high16 v4, 0x3ff4000000000000L

    mul-double/2addr v2, v4

    double-to-int v1, v2

    .line 1054
    .local v1, "textSize":I
    iget-object v2, p0, Landroid/support/v7/widget/SearchView;->mSearchHintIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v6, v6, v1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1056
    new-instance v0, Landroid/text/SpannableStringBuilder;

    const-string v2, "   "

    invoke-direct {v0, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1057
    .local v0, "ssb":Landroid/text/SpannableStringBuilder;
    new-instance v2, Landroid/text/style/ImageSpan;

    iget-object v3, p0, Landroid/support/v7/widget/SearchView;->mSearchHintIcon:Landroid/graphics/drawable/Drawable;

    invoke-direct {v2, v3}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;)V

    const/4 v3, 0x1

    const/4 v4, 0x2

    const/16 v5, 0x21

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1058
    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_a
.end method

.method private getPreferredWidth()I
    .registers 3

    .prologue
    .line 818
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroid/support/v7/appcompat/R$dimen;->abc_search_view_preferred_width:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method private hasVoiceSearch()Z
    .registers 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 840
    iget-object v3, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    if-eqz v3, :cond_2b

    iget-object v3, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    invoke-virtual {v3}, Landroid/app/SearchableInfo;->getVoiceSearchEnabled()Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 841
    const/4 v1, 0x0

    .line 842
    .local v1, "testIntent":Landroid/content/Intent;
    iget-object v3, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    invoke-virtual {v3}, Landroid/app/SearchableInfo;->getVoiceSearchLaunchWebSearch()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 843
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mVoiceWebSearchIntent:Landroid/content/Intent;

    .line 847
    :cond_18
    :goto_18
    if-eqz v1, :cond_2b

    .line 848
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/high16 v4, 0x10000

    invoke-virtual {v3, v1, v4}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    .line 850
    .local v0, "ri":Landroid/content/pm/ResolveInfo;
    if-eqz v0, :cond_2b

    const/4 v2, 0x1

    .line 853
    .end local v0    # "ri":Landroid/content/pm/ResolveInfo;
    .end local v1    # "testIntent":Landroid/content/Intent;
    :cond_2b
    return v2

    .line 844
    .restart local v1    # "testIntent":Landroid/content/Intent;
    :cond_2c
    iget-object v3, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    invoke-virtual {v3}, Landroid/app/SearchableInfo;->getVoiceSearchLaunchRecognizer()Z

    move-result v3

    if-eqz v3, :cond_18

    .line 845
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mVoiceAppSearchIntent:Landroid/content/Intent;

    goto :goto_18
.end method

.method static isLandscapeMode(Landroid/content/Context;)Z
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 1604
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private isSubmitAreaEnabled()Z
    .registers 2

    .prologue
    .line 857
    iget-boolean v0, p0, Landroid/support/v7/widget/SearchView;->mSubmitButtonEnabled:Z

    if-nez v0, :cond_8

    iget-boolean v0, p0, Landroid/support/v7/widget/SearchView;->mVoiceButtonEnabled:Z

    if-eqz v0, :cond_10

    :cond_8
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->isIconified()Z

    move-result v0

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private launchQuerySearch(ILjava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "actionKey"    # I
    .param p2, "actionMsg"    # Ljava/lang/String;
    .param p3, "query"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 1413
    const-string v1, "android.intent.action.SEARCH"

    .local v1, "action":Ljava/lang/String;
    move-object v0, p0

    move-object v3, v2

    move-object v4, p3

    move v5, p1

    move-object v6, p2

    .line 1414
    invoke-direct/range {v0 .. v6}, Landroid/support/v7/widget/SearchView;->createIntent(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Landroid/content/Intent;

    move-result-object v7

    .line 1415
    .local v7, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 1416
    return-void
.end method

.method private onCloseClicked()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 1167
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 1168
    .local v0, "text":Ljava/lang/CharSequence;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 1169
    iget-boolean v1, p0, Landroid/support/v7/widget/SearchView;->mIconifiedByDefault:Z

    if-eqz v1, :cond_23

    .line 1171
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mOnCloseListener:Landroid/support/v7/widget/SearchView$OnCloseListener;

    if-eqz v1, :cond_1d

    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mOnCloseListener:Landroid/support/v7/widget/SearchView$OnCloseListener;

    invoke-interface {v1}, Landroid/support/v7/widget/SearchView$OnCloseListener;->onClose()Z

    move-result v1

    if-nez v1, :cond_23

    .line 1173
    :cond_1d
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->clearFocus()V

    .line 1175
    invoke-direct {p0, v3}, Landroid/support/v7/widget/SearchView;->updateViewsVisibility(Z)V

    .line 1184
    :cond_23
    :goto_23
    return-void

    .line 1179
    :cond_24
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setText(Ljava/lang/CharSequence;)V

    .line 1180
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->requestFocus()Z

    .line 1181
    invoke-direct {p0, v3}, Landroid/support/v7/widget/SearchView;->setImeVisibility(Z)V

    goto :goto_23
.end method

.method private onSearchClicked()V
    .registers 2

    .prologue
    .line 1187
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/SearchView;->updateViewsVisibility(Z)V

    .line 1188
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->requestFocus()Z

    .line 1189
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroid/support/v7/widget/SearchView;->setImeVisibility(Z)V

    .line 1190
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mOnSearchClickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_16

    .line 1191
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mOnSearchClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 1193
    :cond_16
    return-void
.end method

.method private onSubmitQuery()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 1149
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 1150
    .local v0, "query":Ljava/lang/CharSequence;
    if-eqz v0, :cond_31

    invoke-static {v0}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I

    move-result v1

    if-lez v1, :cond_31

    .line 1151
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mOnQueryChangeListener:Landroid/support/v7/widget/SearchView$OnQueryTextListener;

    if-eqz v1, :cond_1f

    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mOnQueryChangeListener:Landroid/support/v7/widget/SearchView$OnQueryTextListener;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/support/v7/widget/SearchView$OnQueryTextListener;->onQueryTextSubmit(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_31

    .line 1153
    :cond_1f
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    if-eqz v1, :cond_2b

    .line 1154
    const/4 v1, 0x0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v3, v1, v2}, Landroid/support/v7/widget/SearchView;->launchQuerySearch(ILjava/lang/String;Ljava/lang/String;)V

    .line 1156
    :cond_2b
    invoke-direct {p0, v3}, Landroid/support/v7/widget/SearchView;->setImeVisibility(Z)V

    .line 1157
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->dismissSuggestions()V

    .line 1160
    :cond_31
    return-void
.end method

.method private postUpdateFocusedState()V
    .registers 2

    .prologue
    .line 892
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mUpdateDrawableStateRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/SearchView;->post(Ljava/lang/Runnable;)Z

    .line 893
    return-void
.end method

.method private setImeVisibility(Z)V
    .registers 5
    .param p1, "visible"    # Z

    .prologue
    .line 917
    if-eqz p1, :cond_8

    .line 918
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mShowImeRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/SearchView;->post(Ljava/lang/Runnable;)Z

    .line 928
    :cond_7
    :goto_7
    return-void

    .line 920
    :cond_8
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mShowImeRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/SearchView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 921
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 924
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    if-eqz v0, :cond_7

    .line 925
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    goto :goto_7
.end method

.method private setQuery(Ljava/lang/CharSequence;)V
    .registers 4
    .param p1, "query"    # Ljava/lang/CharSequence;

    .prologue
    .line 1407
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setText(Ljava/lang/CharSequence;)V

    .line 1409
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x0

    :goto_e
    invoke-virtual {v1, v0}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setSelection(I)V

    .line 1410
    return-void

    .line 1409
    :cond_12
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    goto :goto_e
.end method

.method private updateCloseButton()V
    .registers 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 880
    iget-object v4, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v4}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_30

    move v1, v2

    .line 883
    .local v1, "hasText":Z
    :goto_f
    if-nez v1, :cond_19

    iget-boolean v4, p0, Landroid/support/v7/widget/SearchView;->mIconifiedByDefault:Z

    if-eqz v4, :cond_32

    iget-boolean v4, p0, Landroid/support/v7/widget/SearchView;->mExpandedInActionView:Z

    if-nez v4, :cond_32

    .line 884
    .local v2, "showClose":Z
    :cond_19
    :goto_19
    iget-object v4, p0, Landroid/support/v7/widget/SearchView;->mCloseButton:Landroid/widget/ImageView;

    if-eqz v2, :cond_34

    :goto_1d
    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 885
    iget-object v3, p0, Landroid/support/v7/widget/SearchView;->mCloseButton:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 886
    .local v0, "closeButtonImg":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_2f

    .line 887
    if-eqz v1, :cond_37

    sget-object v3, Landroid/support/v7/widget/SearchView;->ENABLED_STATE_SET:[I

    :goto_2c
    invoke-virtual {v0, v3}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 889
    :cond_2f
    return-void

    .end local v0    # "closeButtonImg":Landroid/graphics/drawable/Drawable;
    .end local v1    # "hasText":Z
    .end local v2    # "showClose":Z
    :cond_30
    move v1, v3

    .line 880
    goto :goto_f

    .restart local v1    # "hasText":Z
    :cond_32
    move v2, v3

    .line 883
    goto :goto_19

    .line 884
    .restart local v2    # "showClose":Z
    :cond_34
    const/16 v3, 0x8

    goto :goto_1d

    .line 887
    .restart local v0    # "closeButtonImg":Landroid/graphics/drawable/Drawable;
    :cond_37
    sget-object v3, Landroid/support/v7/widget/SearchView;->EMPTY_STATE_SET:[I

    goto :goto_2c
.end method

.method private updateQueryHint()V
    .registers 4

    .prologue
    .line 1063
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->getQueryHint()Ljava/lang/CharSequence;

    move-result-object v0

    .line 1064
    .local v0, "hint":Ljava/lang/CharSequence;
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    if-nez v0, :cond_a

    const-string v0, ""

    .end local v0    # "hint":Ljava/lang/CharSequence;
    :cond_a
    invoke-direct {p0, v0}, Landroid/support/v7/widget/SearchView;->getDecoratedHint(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setHint(Ljava/lang/CharSequence;)V

    .line 1065
    return-void
.end method

.method private updateSearchAutoComplete()V
    .registers 7
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 1072
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    iget-object v3, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    invoke-virtual {v3}, Landroid/app/SearchableInfo;->getSuggestThreshold()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setThreshold(I)V

    .line 1073
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    iget-object v3, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    invoke-virtual {v3}, Landroid/app/SearchableInfo;->getImeOptions()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setImeOptions(I)V

    .line 1074
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    invoke-virtual {v1}, Landroid/app/SearchableInfo;->getInputType()I

    move-result v0

    .line 1077
    .local v0, "inputType":I
    and-int/lit8 v1, v0, 0xf

    if-ne v1, v2, :cond_33

    .line 1080
    const v1, -0x10001

    and-int/2addr v0, v1

    .line 1081
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    invoke-virtual {v1}, Landroid/app/SearchableInfo;->getSuggestAuthority()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_33

    .line 1082
    const/high16 v1, 0x10000

    or-int/2addr v0, v1

    .line 1089
    const/high16 v1, 0x80000

    or-int/2addr v0, v1

    .line 1092
    :cond_33
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setInputType(I)V

    .line 1093
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSuggestionsAdapter:Landroid/support/v4/widget/CursorAdapter;

    if-eqz v1, :cond_42

    .line 1094
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSuggestionsAdapter:Landroid/support/v4/widget/CursorAdapter;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/support/v4/widget/CursorAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 1098
    :cond_42
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    invoke-virtual {v1}, Landroid/app/SearchableInfo;->getSuggestAuthority()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6c

    .line 1099
    new-instance v1, Landroid/support/v7/widget/SuggestionsAdapter;

    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    iget-object v5, p0, Landroid/support/v7/widget/SearchView;->mOutsideDrawablesCache:Ljava/util/WeakHashMap;

    invoke-direct {v1, v3, p0, v4, v5}, Landroid/support/v7/widget/SuggestionsAdapter;-><init>(Landroid/content/Context;Landroid/support/v7/widget/SearchView;Landroid/app/SearchableInfo;Ljava/util/WeakHashMap;)V

    iput-object v1, p0, Landroid/support/v7/widget/SearchView;->mSuggestionsAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 1101
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    iget-object v3, p0, Landroid/support/v7/widget/SearchView;->mSuggestionsAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1102
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSuggestionsAdapter:Landroid/support/v4/widget/CursorAdapter;

    check-cast v1, Landroid/support/v7/widget/SuggestionsAdapter;

    iget-boolean v3, p0, Landroid/support/v7/widget/SearchView;->mQueryRefinement:Z

    if-eqz v3, :cond_69

    const/4 v2, 0x2

    :cond_69
    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SuggestionsAdapter;->setQueryRefinement(I)V

    .line 1106
    :cond_6c
    return-void
.end method

.method private updateSubmitArea()V
    .registers 3

    .prologue
    .line 870
    const/16 v0, 0x8

    .line 871
    .local v0, "visibility":I
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->isSubmitAreaEnabled()Z

    move-result v1

    if-eqz v1, :cond_19

    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mGoButton:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_18

    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mVoiceButton:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_19

    .line 874
    :cond_18
    const/4 v0, 0x0

    .line 876
    :cond_19
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSubmitArea:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 877
    return-void
.end method

.method private updateSubmitButton(Z)V
    .registers 4
    .param p1, "hasText"    # Z

    .prologue
    .line 861
    const/16 v0, 0x8

    .line 862
    .local v0, "visibility":I
    iget-boolean v1, p0, Landroid/support/v7/widget/SearchView;->mSubmitButtonEnabled:Z

    if-eqz v1, :cond_19

    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->isSubmitAreaEnabled()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->hasFocus()Z

    move-result v1

    if-eqz v1, :cond_19

    if-nez p1, :cond_18

    iget-boolean v1, p0, Landroid/support/v7/widget/SearchView;->mVoiceButtonEnabled:Z

    if-nez v1, :cond_19

    .line 864
    :cond_18
    const/4 v0, 0x0

    .line 866
    :cond_19
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mGoButton:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 867
    return-void
.end method

.method private updateViewsVisibility(Z)V
    .registers 9
    .param p1, "collapsed"    # Z

    .prologue
    const/4 v4, 0x1

    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 823
    iput-boolean p1, p0, Landroid/support/v7/widget/SearchView;->mIconified:Z

    .line 825
    if-eqz p1, :cond_3b

    move v1, v2

    .line 827
    .local v1, "visCollapsed":I
    :goto_9
    iget-object v5, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v5}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3d

    move v0, v4

    .line 829
    .local v0, "hasText":Z
    :goto_16
    iget-object v5, p0, Landroid/support/v7/widget/SearchView;->mSearchButton:Landroid/widget/ImageView;

    invoke-virtual {v5, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 830
    invoke-direct {p0, v0}, Landroid/support/v7/widget/SearchView;->updateSubmitButton(Z)V

    .line 831
    iget-object v6, p0, Landroid/support/v7/widget/SearchView;->mSearchEditFrame:Landroid/view/View;

    if-eqz p1, :cond_3f

    move v5, v3

    :goto_23
    invoke-virtual {v6, v5}, Landroid/view/View;->setVisibility(I)V

    .line 832
    iget-object v5, p0, Landroid/support/v7/widget/SearchView;->mCollapsedIcon:Landroid/widget/ImageView;

    iget-boolean v6, p0, Landroid/support/v7/widget/SearchView;->mIconifiedByDefault:Z

    if-eqz v6, :cond_41

    :goto_2c
    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 833
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->updateCloseButton()V

    .line 834
    if-nez v0, :cond_43

    :goto_34
    invoke-direct {p0, v4}, Landroid/support/v7/widget/SearchView;->updateVoiceButton(Z)V

    .line 835
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->updateSubmitArea()V

    .line 836
    return-void

    .end local v0    # "hasText":Z
    .end local v1    # "visCollapsed":I
    :cond_3b
    move v1, v3

    .line 825
    goto :goto_9

    .restart local v1    # "visCollapsed":I
    :cond_3d
    move v0, v2

    .line 827
    goto :goto_16

    .restart local v0    # "hasText":Z
    :cond_3f
    move v5, v2

    .line 831
    goto :goto_23

    :cond_41
    move v3, v2

    .line 832
    goto :goto_2c

    :cond_43
    move v4, v2

    .line 834
    goto :goto_34
.end method

.method private updateVoiceButton(Z)V
    .registers 5
    .param p1, "empty"    # Z

    .prologue
    .line 1115
    const/16 v0, 0x8

    .line 1116
    .local v0, "visibility":I
    iget-boolean v1, p0, Landroid/support/v7/widget/SearchView;->mVoiceButtonEnabled:Z

    if-eqz v1, :cond_16

    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->isIconified()Z

    move-result v1

    if-nez v1, :cond_16

    if-eqz p1, :cond_16

    .line 1117
    const/4 v0, 0x0

    .line 1118
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mGoButton:Landroid/widget/ImageView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1120
    :cond_16
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mVoiceButton:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1121
    return-void
.end method


# virtual methods
.method public clearFocus()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 512
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/SearchView;->mClearingFocus:Z

    .line 513
    invoke-direct {p0, v1}, Landroid/support/v7/widget/SearchView;->setImeVisibility(Z)V

    .line 514
    invoke-super {p0}, Landroid/support/v7/widget/LinearLayoutCompat;->clearFocus()V

    .line 515
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->clearFocus()V

    .line 516
    iput-boolean v1, p0, Landroid/support/v7/widget/SearchView;->mClearingFocus:Z

    .line 517
    return-void
.end method

.method public getImeOptions()I
    .registers 2

    .prologue
    .line 469
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->getImeOptions()I

    move-result v0

    return v0
.end method

.method public getInputType()I
    .registers 2

    .prologue
    .line 487
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->getInputType()I

    move-result v0

    return v0
.end method

.method public getMaxWidth()I
    .registers 2

    .prologue
    .line 779
    iget v0, p0, Landroid/support/v7/widget/SearchView;->mMaxWidth:I

    return v0
.end method

.method public getQuery()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 574
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->getText()Landroid/text/Editable;

    move-result-object v0

    return-object v0
.end method

.method public getQueryHint()Ljava/lang/CharSequence;
    .registers 4

    .prologue
    .line 629
    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mQueryHint:Ljava/lang/CharSequence;

    if-eqz v1, :cond_7

    .line 630
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mQueryHint:Ljava/lang/CharSequence;

    .line 636
    .local v0, "hint":Ljava/lang/CharSequence;
    :goto_6
    return-object v0

    .line 631
    .end local v0    # "hint":Ljava/lang/CharSequence;
    :cond_7
    sget-boolean v1, Landroid/support/v7/widget/SearchView;->IS_AT_LEAST_FROYO:Z

    if-eqz v1, :cond_26

    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    if-eqz v1, :cond_26

    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    invoke-virtual {v1}, Landroid/app/SearchableInfo;->getHintId()I

    move-result v1

    if-eqz v1, :cond_26

    .line 632
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    invoke-virtual {v2}, Landroid/app/SearchableInfo;->getHintId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .restart local v0    # "hint":Ljava/lang/CharSequence;
    goto :goto_6

    .line 634
    .end local v0    # "hint":Ljava/lang/CharSequence;
    :cond_26
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mDefaultQueryHint:Ljava/lang/CharSequence;

    .restart local v0    # "hint":Ljava/lang/CharSequence;
    goto :goto_6
.end method

.method getSuggestionCommitIconResId()I
    .registers 2

    .prologue
    .line 414
    iget v0, p0, Landroid/support/v7/widget/SearchView;->mSuggestionCommitIconResId:I

    return v0
.end method

.method getSuggestionRowLayout()I
    .registers 2

    .prologue
    .line 410
    iget v0, p0, Landroid/support/v7/widget/SearchView;->mSuggestionRowLayout:I

    return v0
.end method

.method public getSuggestionsAdapter()Landroid/support/v4/widget/CursorAdapter;
    .registers 2

    .prologue
    .line 761
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSuggestionsAdapter:Landroid/support/v4/widget/CursorAdapter;

    return-object v0
.end method

.method public isIconified()Z
    .registers 2

    .prologue
    .line 689
    iget-boolean v0, p0, Landroid/support/v7/widget/SearchView;->mIconified:Z

    return v0
.end method

.method public onActionViewCollapsed()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 1241
    const-string v0, ""

    invoke-virtual {p0, v0, v2}, Landroid/support/v7/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    .line 1242
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->clearFocus()V

    .line 1243
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroid/support/v7/widget/SearchView;->updateViewsVisibility(Z)V

    .line 1244
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    iget v1, p0, Landroid/support/v7/widget/SearchView;->mCollapsedImeOptions:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setImeOptions(I)V

    .line 1245
    iput-boolean v2, p0, Landroid/support/v7/widget/SearchView;->mExpandedInActionView:Z

    .line 1246
    return-void
.end method

.method public onActionViewExpanded()V
    .registers 4

    .prologue
    .line 1253
    iget-boolean v0, p0, Landroid/support/v7/widget/SearchView;->mExpandedInActionView:Z

    if-eqz v0, :cond_5

    .line 1260
    :goto_4
    return-void

    .line 1255
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/SearchView;->mExpandedInActionView:Z

    .line 1256
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->getImeOptions()I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/SearchView;->mCollapsedImeOptions:I

    .line 1257
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    iget v1, p0, Landroid/support/v7/widget/SearchView;->mCollapsedImeOptions:I

    const/high16 v2, 0x2000000

    or-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setImeOptions(I)V

    .line 1258
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setText(Ljava/lang/CharSequence;)V

    .line 1259
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/SearchView;->setIconified(Z)V

    goto :goto_4
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 911
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mUpdateDrawableStateRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/SearchView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 912
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mReleaseCursorRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/SearchView;->post(Ljava/lang/Runnable;)Z

    .line 913
    invoke-super {p0}, Landroid/support/v7/widget/LinearLayoutCompat;->onDetachedFromWindow()V

    .line 914
    return-void
.end method

.method protected onMeasure(II)V
    .registers 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 785
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->isIconified()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 786
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutCompat;->onMeasure(II)V

    .line 815
    :goto_9
    return-void

    .line 790
    :cond_a
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 791
    .local v1, "widthMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 793
    .local v0, "width":I
    sparse-switch v1, :sswitch_data_4a

    .line 813
    :cond_15
    :goto_15
    const/high16 v1, 0x40000000

    .line 814
    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-super {p0, v2, p2}, Landroid/support/v7/widget/LinearLayoutCompat;->onMeasure(II)V

    goto :goto_9

    .line 796
    :sswitch_1f
    iget v2, p0, Landroid/support/v7/widget/SearchView;->mMaxWidth:I

    if-lez v2, :cond_2a

    .line 797
    iget v2, p0, Landroid/support/v7/widget/SearchView;->mMaxWidth:I

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_15

    .line 799
    :cond_2a
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->getPreferredWidth()I

    move-result v2

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 801
    goto :goto_15

    .line 804
    :sswitch_33
    iget v2, p0, Landroid/support/v7/widget/SearchView;->mMaxWidth:I

    if-lez v2, :cond_15

    .line 805
    iget v2, p0, Landroid/support/v7/widget/SearchView;->mMaxWidth:I

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_15

    .line 810
    :sswitch_3e
    iget v2, p0, Landroid/support/v7/widget/SearchView;->mMaxWidth:I

    if-lez v2, :cond_45

    iget v0, p0, Landroid/support/v7/widget/SearchView;->mMaxWidth:I

    :goto_44
    goto :goto_15

    :cond_45
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->getPreferredWidth()I

    move-result v0

    goto :goto_44

    .line 793
    :sswitch_data_4a
    .sparse-switch
        -0x80000000 -> :sswitch_1f
        0x0 -> :sswitch_3e
        0x40000000 -> :sswitch_33
    .end sparse-switch
.end method

.method onQueryRefine(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "queryText"    # Ljava/lang/CharSequence;

    .prologue
    .line 935
    invoke-direct {p0, p1}, Landroid/support/v7/widget/SearchView;->setQuery(Ljava/lang/CharSequence;)V

    .line 936
    return-void
.end method

.method onTextFocusChanged()V
    .registers 2

    .prologue
    .line 1220
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->isIconified()Z

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/SearchView;->updateViewsVisibility(Z)V

    .line 1223
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->postUpdateFocusedState()V

    .line 1224
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 1225
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->forceSuggestionQuery()V

    .line 1227
    :cond_15
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .registers 2
    .param p1, "hasWindowFocus"    # Z

    .prologue
    .line 1231
    invoke-super {p0, p1}, Landroid/support/v7/widget/LinearLayoutCompat;->onWindowFocusChanged(Z)V

    .line 1233
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->postUpdateFocusedState()V

    .line 1234
    return-void
.end method

.method public requestFocus(ILandroid/graphics/Rect;)Z
    .registers 6
    .param p1, "direction"    # I
    .param p2, "previouslyFocusedRect"    # Landroid/graphics/Rect;

    .prologue
    const/4 v1, 0x0

    .line 494
    iget-boolean v2, p0, Landroid/support/v7/widget/SearchView;->mClearingFocus:Z

    if-eqz v2, :cond_7

    move v0, v1

    .line 505
    :cond_6
    :goto_6
    return v0

    .line 496
    :cond_7
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->isFocusable()Z

    move-result v2

    if-nez v2, :cond_f

    move v0, v1

    goto :goto_6

    .line 498
    :cond_f
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->isIconified()Z

    move-result v2

    if-nez v2, :cond_21

    .line 499
    iget-object v2, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v2, p1, p2}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result v0

    .line 500
    .local v0, "result":Z
    if-eqz v0, :cond_6

    .line 501
    invoke-direct {p0, v1}, Landroid/support/v7/widget/SearchView;->updateViewsVisibility(Z)V

    goto :goto_6

    .line 505
    .end local v0    # "result":Z
    :cond_21
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutCompat;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result v0

    goto :goto_6
.end method

.method public setAppSearchData(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "appSearchData"    # Landroid/os/Bundle;

    .prologue
    .line 450
    iput-object p1, p0, Landroid/support/v7/widget/SearchView;->mAppSearchData:Landroid/os/Bundle;

    .line 451
    return-void
.end method

.method public setIconified(Z)V
    .registers 2
    .param p1, "iconify"    # Z

    .prologue
    .line 675
    if-eqz p1, :cond_6

    .line 676
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->onCloseClicked()V

    .line 680
    :goto_5
    return-void

    .line 678
    :cond_6
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->onSearchClicked()V

    goto :goto_5
.end method

.method public setIconifiedByDefault(Z)V
    .registers 3
    .param p1, "iconified"    # Z

    .prologue
    .line 650
    iget-boolean v0, p0, Landroid/support/v7/widget/SearchView;->mIconifiedByDefault:Z

    if-ne v0, p1, :cond_5

    .line 654
    :goto_4
    return-void

    .line 651
    :cond_5
    iput-boolean p1, p0, Landroid/support/v7/widget/SearchView;->mIconifiedByDefault:Z

    .line 652
    invoke-direct {p0, p1}, Landroid/support/v7/widget/SearchView;->updateViewsVisibility(Z)V

    .line 653
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->updateQueryHint()V

    goto :goto_4
.end method

.method public setImeOptions(I)V
    .registers 3
    .param p1, "imeOptions"    # I

    .prologue
    .line 460
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setImeOptions(I)V

    .line 461
    return-void
.end method

.method public setInputType(I)V
    .registers 3
    .param p1, "inputType"    # I

    .prologue
    .line 479
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setInputType(I)V

    .line 480
    return-void
.end method

.method public setMaxWidth(I)V
    .registers 2
    .param p1, "maxpixels"    # I

    .prologue
    .line 768
    iput p1, p0, Landroid/support/v7/widget/SearchView;->mMaxWidth:I

    .line 770
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->requestLayout()V

    .line 771
    return-void
.end method

.method public setOnCloseListener(Landroid/support/v7/widget/SearchView$OnCloseListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v7/widget/SearchView$OnCloseListener;

    .prologue
    .line 535
    iput-object p1, p0, Landroid/support/v7/widget/SearchView;->mOnCloseListener:Landroid/support/v7/widget/SearchView$OnCloseListener;

    .line 536
    return-void
.end method

.method public setOnQueryTextFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/view/View$OnFocusChangeListener;

    .prologue
    .line 544
    iput-object p1, p0, Landroid/support/v7/widget/SearchView;->mOnQueryTextFocusChangeListener:Landroid/view/View$OnFocusChangeListener;

    .line 545
    return-void
.end method

.method public setOnQueryTextListener(Landroid/support/v7/widget/SearchView$OnQueryTextListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v7/widget/SearchView$OnQueryTextListener;

    .prologue
    .line 526
    iput-object p1, p0, Landroid/support/v7/widget/SearchView;->mOnQueryChangeListener:Landroid/support/v7/widget/SearchView$OnQueryTextListener;

    .line 527
    return-void
.end method

.method public setOnSearchClickListener(Landroid/view/View$OnClickListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 565
    iput-object p1, p0, Landroid/support/v7/widget/SearchView;->mOnSearchClickListener:Landroid/view/View$OnClickListener;

    .line 566
    return-void
.end method

.method public setOnSuggestionListener(Landroid/support/v7/widget/SearchView$OnSuggestionListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v7/widget/SearchView$OnSuggestionListener;

    .prologue
    .line 553
    iput-object p1, p0, Landroid/support/v7/widget/SearchView;->mOnSuggestionListener:Landroid/support/v7/widget/SearchView$OnSuggestionListener;

    .line 554
    return-void
.end method

.method public setQuery(Ljava/lang/CharSequence;Z)V
    .registers 5
    .param p1, "query"    # Ljava/lang/CharSequence;
    .param p2, "submit"    # Z

    .prologue
    .line 586
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setText(Ljava/lang/CharSequence;)V

    .line 587
    if-eqz p1, :cond_14

    .line 588
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setSelection(I)V

    .line 589
    iput-object p1, p0, Landroid/support/v7/widget/SearchView;->mUserQuery:Ljava/lang/CharSequence;

    .line 593
    :cond_14
    if-eqz p2, :cond_1f

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1f

    .line 594
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->onSubmitQuery()V

    .line 596
    :cond_1f
    return-void
.end method

.method public setQueryHint(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "hint"    # Ljava/lang/CharSequence;

    .prologue
    .line 608
    iput-object p1, p0, Landroid/support/v7/widget/SearchView;->mQueryHint:Ljava/lang/CharSequence;

    .line 609
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->updateQueryHint()V

    .line 610
    return-void
.end method

.method public setQueryRefinementEnabled(Z)V
    .registers 4
    .param p1, "enable"    # Z

    .prologue
    .line 729
    iput-boolean p1, p0, Landroid/support/v7/widget/SearchView;->mQueryRefinement:Z

    .line 730
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSuggestionsAdapter:Landroid/support/v4/widget/CursorAdapter;

    instance-of v0, v0, Landroid/support/v7/widget/SuggestionsAdapter;

    if-eqz v0, :cond_12

    .line 731
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSuggestionsAdapter:Landroid/support/v4/widget/CursorAdapter;

    check-cast v0, Landroid/support/v7/widget/SuggestionsAdapter;

    if-eqz p1, :cond_13

    const/4 v1, 0x2

    :goto_f
    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SuggestionsAdapter;->setQueryRefinement(I)V

    .line 734
    :cond_12
    return-void

    .line 731
    :cond_13
    const/4 v1, 0x1

    goto :goto_f
.end method

.method public setSearchableInfo(Landroid/app/SearchableInfo;)V
    .registers 4
    .param p1, "searchable"    # Landroid/app/SearchableInfo;

    .prologue
    .line 426
    iput-object p1, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    .line 427
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchable:Landroid/app/SearchableInfo;

    if-eqz v0, :cond_10

    .line 428
    sget-boolean v0, Landroid/support/v7/widget/SearchView;->IS_AT_LEAST_FROYO:Z

    if-eqz v0, :cond_d

    .line 429
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->updateSearchAutoComplete()V

    .line 431
    :cond_d
    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->updateQueryHint()V

    .line 434
    :cond_10
    sget-boolean v0, Landroid/support/v7/widget/SearchView;->IS_AT_LEAST_FROYO:Z

    if-eqz v0, :cond_30

    invoke-direct {p0}, Landroid/support/v7/widget/SearchView;->hasVoiceSearch()Z

    move-result v0

    if-eqz v0, :cond_30

    const/4 v0, 0x1

    :goto_1b
    iput-boolean v0, p0, Landroid/support/v7/widget/SearchView;->mVoiceButtonEnabled:Z

    .line 436
    iget-boolean v0, p0, Landroid/support/v7/widget/SearchView;->mVoiceButtonEnabled:Z

    if-eqz v0, :cond_28

    .line 439
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    const-string v1, "nm"

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setPrivateImeOptions(Ljava/lang/String;)V

    .line 441
    :cond_28
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->isIconified()Z

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/SearchView;->updateViewsVisibility(Z)V

    .line 442
    return-void

    .line 434
    :cond_30
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method public setSubmitButtonEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 701
    iput-boolean p1, p0, Landroid/support/v7/widget/SearchView;->mSubmitButtonEnabled:Z

    .line 702
    invoke-virtual {p0}, Landroid/support/v7/widget/SearchView;->isIconified()Z

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/SearchView;->updateViewsVisibility(Z)V

    .line 703
    return-void
.end method

.method public setSuggestionsAdapter(Landroid/support/v4/widget/CursorAdapter;)V
    .registers 4
    .param p1, "adapter"    # Landroid/support/v4/widget/CursorAdapter;

    .prologue
    .line 751
    iput-object p1, p0, Landroid/support/v7/widget/SearchView;->mSuggestionsAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 753
    iget-object v0, p0, Landroid/support/v7/widget/SearchView;->mSearchSrcTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    iget-object v1, p0, Landroid/support/v7/widget/SearchView;->mSuggestionsAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SearchView$SearchAutoComplete;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 754
    return-void
.end method
