.class public Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "BehanceSDKCreativeFieldsFilterDialog.java"

# interfaces
.implements Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$Callbacks;
    }
.end annotation


# instance fields
.field private callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$Callbacks;

.field private context:Landroid/content/Context;

.field private progressSpinner:Landroid/view/View;

.field private rootView:Landroid/view/View;

.field private sectionalAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;

.field private selectable_field_count:I

.field private selectedFields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 60
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 52
    const/4 v0, -0x1

    iput v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectable_field_count:I

    .line 61
    invoke-static {}, Lcom/behance/sdk/datamanager/FiltersDataManager;->getInstance()Lcom/behance/sdk/datamanager/FiltersDataManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/behance/sdk/datamanager/FiltersDataManager;->addListener(Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;)V

    .line 62
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->notifyListenersAndCloseDialog()V

    return-void
.end method

.method static synthetic access$100(Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;Landroid/widget/AdapterView;I)V
    .registers 3
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;
    .param p1, "x1"    # Landroid/widget/AdapterView;
    .param p2, "x2"    # I

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->handleCreativeFieldSelection(Landroid/widget/AdapterView;I)V

    return-void
.end method

.method private handleCreativeFieldSelection(Landroid/widget/AdapterView;I)V
    .registers 7
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;I)V"
        }
    .end annotation

    .prologue
    .line 160
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1, p2}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    .line 161
    .local v0, "itemAtPosition":Ljava/lang/Object;
    instance-of v2, v0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;

    if-eqz v2, :cond_1d

    move-object v1, v0

    .line 162
    check-cast v1, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;

    .line 163
    .local v1, "selectedField":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 164
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 173
    :cond_18
    :goto_18
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->sectionalAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;

    invoke-virtual {v2}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->notifyDataSetChanged()V

    .line 175
    .end local v1    # "selectedField":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    :cond_1d
    return-void

    .line 166
    .restart local v1    # "selectedField":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    :cond_1e
    iget v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectable_field_count:I

    if-ltz v2, :cond_2c

    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    iget v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectable_field_count:I

    if-ge v2, v3, :cond_18

    .line 167
    :cond_2c
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    iget v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectable_field_count:I

    if-ne v2, v3, :cond_18

    .line 169
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->notifyListenersAndCloseDialog()V

    goto :goto_18
.end method

.method private hideProgressSpinner()V
    .registers 3

    .prologue
    .line 119
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->progressSpinner:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 120
    return-void
.end method

.method private notifyListenersAndCloseDialog()V
    .registers 3

    .prologue
    .line 190
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$Callbacks;

    if-eqz v0, :cond_b

    .line 191
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$Callbacks;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    invoke-interface {v0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$Callbacks;->onCreativeFieldsSelected(Ljava/util/List;)V

    .line 193
    :cond_b
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 194
    return-void
.end method

.method private populateListView(Ljava/util/List;Landroid/view/LayoutInflater;)V
    .registers 7
    .param p2, "inflater"    # Landroid/view/LayoutInflater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;",
            "Landroid/view/LayoutInflater;",
            ")V"
        }
    .end annotation

    .prologue
    .line 141
    .local p1, "creativeFields":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->rootView:Landroid/view/View;

    if-eqz v1, :cond_33

    .line 142
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->hideProgressSpinner()V

    .line 143
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->rootView:Landroid/view/View;

    sget v2, Lcom/behance/sdk/R$id;->bsdkPublishProjectcreativeFieldFilterDialogSectionalListView:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/google/listview/SectionalListView;

    .line 144
    .local v0, "lsComposer":Lcom/behance/sdk/google/listview/SectionalListView;
    sget v1, Lcom/behance/sdk/R$layout;->bsdk_adapter_publish_project_creative_field_item_header:I

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/google/listview/SectionalListView;->setPinnedHeaderView(Landroid/view/View;)V

    .line 145
    new-instance v1, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;

    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    invoke-direct {v1, v2, p1, v3}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/util/List;)V

    iput-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->sectionalAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;

    .line 146
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->sectionalAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/google/listview/SectionalListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 147
    new-instance v1, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$3;

    invoke-direct {v1, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$3;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;)V

    invoke-virtual {v0, v1}, Lcom/behance/sdk/google/listview/SectionalListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 156
    .end local v0    # "lsComposer":Lcom/behance/sdk/google/listview/SectionalListView;
    :cond_33
    return-void
.end method

.method private showProgressSpinner()V
    .registers 3

    .prologue
    .line 115
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->progressSpinner:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 116
    return-void
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 127
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 128
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->context:Landroid/content/Context;

    .line 129
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 70
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 71
    const/4 v0, 0x2

    sget v1, Lcom/behance/sdk/R$style;->BsdkFilterDialogTheme:I

    invoke-virtual {p0, v0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->setStyle(II)V

    .line 72
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 78
    if-eqz p3, :cond_15

    .line 79
    const-string v3, "BUNDLE_KEY_FIELD_ID"

    invoke-virtual {p3, v3}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    .line 80
    const-string v3, "BUNDLE_KEY_SELECTABLE_FIELD_COUNT"

    const/4 v4, -0x1

    invoke-virtual {p3, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectable_field_count:I

    .line 82
    :cond_15
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    if-nez v3, :cond_20

    .line 83
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    .line 85
    :cond_20
    sget v3, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_creative_field_filter:I

    const/4 v4, 0x0

    invoke-virtual {p1, v3, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->rootView:Landroid/view/View;

    .line 86
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->rootView:Landroid/view/View;

    sget v4, Lcom/behance/sdk/R$id;->bsdkPublishProjectcreativeFieldFilterDialogHeaderLayout:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 87
    .local v2, "titleLayout":Landroid/view/View;
    new-instance v3, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$1;

    invoke-direct {v3, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$1;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->rootView:Landroid/view/View;

    sget v4, Lcom/behance/sdk/R$id;->bsdkPublishProjectcreativeFieldFilterDialogProgressSpinner:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->progressSpinner:Landroid/view/View;

    .line 96
    invoke-static {}, Lcom/behance/sdk/datamanager/FiltersDataManager;->getInstance()Lcom/behance/sdk/datamanager/FiltersDataManager;

    move-result-object v1

    .line 97
    .local v1, "instance":Lcom/behance/sdk/datamanager/FiltersDataManager;
    invoke-virtual {v1}, Lcom/behance/sdk/datamanager/FiltersDataManager;->isLoadCreativeFieldsTaskInProgress()Z

    move-result v3

    if-nez v3, :cond_5b

    .line 98
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->showProgressSpinner()V

    .line 99
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/behance/sdk/datamanager/FiltersDataManager;->loadCreativeFields(Lcom/behance/sdk/IBehanceSDKUserCredentials;)V

    .line 101
    :cond_5b
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->rootView:Landroid/view/View;

    sget v4, Lcom/behance/sdk/R$id;->bsdkPublishProjectcreativeFieldFilterDialogCloseDialogBtnBottom:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 102
    .local v0, "doneButton":Landroid/view/View;
    new-instance v3, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$2;

    invoke-direct {v3, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$2;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->rootView:Landroid/view/View;

    return-object v3
.end method

.method public onCreativeFieldsLoadingFailure(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 180
    return-void
.end method

.method public onCreativeFieldsLoadingSuccess(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 135
    .local p1, "creativeFields":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->populateListView(Ljava/util/List;Landroid/view/LayoutInflater;)V

    .line 136
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    .line 208
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 209
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    if-eqz v0, :cond_10

    .line 210
    const-string v1, "BUNDLE_KEY_FIELD_ID"

    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    check-cast v0, Ljava/io/Serializable;

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 212
    :cond_10
    const-string v0, "BUNDLE_KEY_SELECTABLE_FIELD_COUNT"

    iget v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectable_field_count:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 213
    return-void
.end method

.method public onStart()V
    .registers 11

    .prologue
    .line 217
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onStart()V

    .line 218
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v7

    if-eqz v7, :cond_46

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    if-eqz v7, :cond_46

    .line 220
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lcom/behance/sdk/R$bool;->bsdk_big_screen:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v7

    if-eqz v7, :cond_47

    .line 221
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lcom/behance/sdk/R$dimen;->global_filter_dialog_width:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 222
    .local v6, "windowWidth":I
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lcom/behance/sdk/R$dimen;->global_filter_dialog_height:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 223
    .local v5, "windowHeight":I
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v7

    invoke-virtual {v7, v6, v5}, Landroid/view/Window;->setLayout(II)V

    .line 233
    .end local v5    # "windowHeight":I
    .end local v6    # "windowWidth":I
    :cond_46
    :goto_46
    return-void

    .line 225
    :cond_47
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lcom/behance/sdk/R$dimen;->bsdk_creative_field_dialog_vertical_padding:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    .line 226
    .local v1, "dimensionPixelVertical":I
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lcom/behance/sdk/R$dimen;->bsdk_creative_field_dialog_horizontal_padding:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    .line 227
    .local v0, "dimensionPixelHorizontal":I
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 228
    .local v2, "displayMetrics":Landroid/util/DisplayMetrics;
    iget v3, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 229
    .local v3, "heightPixels":I
    iget v4, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 230
    .local v4, "widthPixels":I
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v7

    sub-int v8, v4, v0

    sub-int v9, v3, v1

    invoke-virtual {v7, v8, v9}, Landroid/view/Window;->setLayout(II)V

    goto :goto_46
.end method

.method public setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$Callbacks;)V
    .registers 2
    .param p1, "callbacks"    # Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$Callbacks;

    .prologue
    .line 187
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$Callbacks;

    .line 188
    return-void
.end method

.method public setSelectableFieldCount(I)V
    .registers 2
    .param p1, "selectable_field_count"    # I

    .prologue
    .line 239
    iput p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectable_field_count:I

    .line 240
    return-void
.end method

.method public setSelectedCreativeField(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 200
    .local p1, "selectedFields":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    if-eqz p1, :cond_e

    .line 201
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    .line 202
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->selectedFields:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 204
    :cond_e
    return-void
.end method
