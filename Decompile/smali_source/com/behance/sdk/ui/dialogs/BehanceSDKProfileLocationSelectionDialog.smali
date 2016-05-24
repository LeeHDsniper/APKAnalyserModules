.class public Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "BehanceSDKProfileLocationSelectionDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;,
        Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$Callbacks;
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private callbacks:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$Callbacks;

.field private citiesListView:Landroid/widget/ListView;

.field private citySearchStrEditText:Landroid/widget/EditText;

.field private countriesListView:Landroid/widget/ListView;

.field private loadingInProgress:Z

.field private locationFiltersDataManager:Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

.field private progressSpinner:Landroid/view/View;

.field private rootView:Landroid/view/View;

.field private selectedCityContainer:Landroid/view/View;

.field private selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

.field private selectedCityTxtView:Landroid/widget/TextView;

.field private selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

.field private selectedCountryTxtView:Landroid/widget/TextView;

.field private selectedStateContainer:Landroid/view/View;

.field private selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

.field private selectedStateTxtView:Landroid/widget/TextView;

.field private statesListView:Landroid/widget/ListView;

.field private viewFlipper:Landroid/widget/ViewFlipper;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 40
    const-class v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 657
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;Landroid/widget/AdapterView;I)V
    .registers 3
    .param p0, "x0"    # Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;
    .param p1, "x1"    # Landroid/widget/AdapterView;
    .param p2, "x2"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->handleStateListItemClick(Landroid/widget/AdapterView;I)V

    return-void
.end method

.method static synthetic access$100(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;Landroid/widget/AdapterView;I)V
    .registers 3
    .param p0, "x0"    # Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;
    .param p1, "x1"    # Landroid/widget/AdapterView;
    .param p2, "x2"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->handleCityListItemClick(Landroid/widget/AdapterView;I)V

    return-void
.end method

.method static synthetic access$200(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$300(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->searchForCities(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;Landroid/widget/AdapterView;I)V
    .registers 3
    .param p0, "x0"    # Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;
    .param p1, "x1"    # Landroid/widget/AdapterView;
    .param p2, "x2"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->handleCountryListItemClick(Landroid/widget/AdapterView;I)V

    return-void
.end method

.method static synthetic access$500(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)Landroid/widget/EditText;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->citySearchStrEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method private clearCitySearchResultsInDisplay()V
    .registers 4

    .prologue
    .line 620
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->hideProgressSpinner()V

    .line 623
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 624
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 627
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->citySearchStrEditText:Landroid/widget/EditText;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 628
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->citiesListView:Landroid/widget/ListView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 629
    return-void
.end method

.method private createCountriesListView()V
    .registers 4

    .prologue
    .line 253
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v2, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogSelectedCountryContainer:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 254
    .local v0, "selectedCountryContainer":Landroid/view/View;
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v2, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogSelectedCountryTxtView:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryTxtView:Landroid/widget/TextView;

    .line 255
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryTxtView:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getSelectedCountry()Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    move-result-object v2

    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 257
    sget-object v1, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->SHOW_COUNTRIES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 258
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 260
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v2, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogCountriesListView:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->countriesListView:Landroid/widget/ListView;

    .line 261
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->countriesListView:Landroid/widget/ListView;

    new-instance v2, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$7;

    invoke-direct {v2, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$7;-><init>(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 269
    invoke-static {}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getInstance()Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

    move-result-object v1

    iput-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->locationFiltersDataManager:Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

    .line 270
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->locationFiltersDataManager:Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

    invoke-virtual {v1, p0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->addListener(Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;)V

    .line 271
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->showProgressSpinner()V

    .line 272
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->locationFiltersDataManager:Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

    invoke-virtual {v1}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->loadCountries()V

    .line 273
    return-void
.end method

.method private displayCitiesView()V
    .registers 5

    .prologue
    .line 468
    iget-boolean v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->loadingInProgress:Z

    if-nez v1, :cond_32

    .line 469
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->setCitiesListAdapter(Ljava/util/List;)V

    .line 470
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$anim;->bsdk_dialog_enter:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/content/Context;I)V

    .line 471
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$anim;->bsdk_dialog_exit:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/content/Context;I)V

    .line 472
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getInAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    .line 475
    .local v0, "inAnimation":Landroid/view/animation/Animation;
    new-instance v1, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$8;

    invoke-direct {v1, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$8;-><init>(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 492
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 494
    .end local v0    # "inAnimation":Landroid/view/animation/Animation;
    :cond_32
    return-void
.end method

.method private displayCountriesView()V
    .registers 4

    .prologue
    .line 445
    iget-boolean v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->loadingInProgress:Z

    if-nez v0, :cond_2b

    .line 446
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$anim;->bsdk_dialog_enter:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/content/Context;I)V

    .line 447
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$anim;->bsdk_dialog_exit:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/content/Context;I)V

    .line 448
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 449
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->locationFiltersDataManager:Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

    invoke-virtual {v0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->isGetCountriesTaskInProgress()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 450
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->showProgressSpinner()V

    .line 456
    :cond_2b
    :goto_2b
    return-void

    .line 452
    :cond_2c
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->updateSelectedCountryInCountriesListView(Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;)V

    .line 453
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->hideProgressSpinner()V

    goto :goto_2b
.end method

.method private displayMainView()V
    .registers 4

    .prologue
    .line 439
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$anim;->bsdk_dialog_enter:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/content/Context;I)V

    .line 440
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$anim;->bsdk_dialog_exit:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/content/Context;I)V

    .line 441
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 442
    return-void
.end method

.method private displaySelectedCityItemInMainView()V
    .registers 3

    .prologue
    .line 311
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 312
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityTxtView:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getSelectedCity()Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    move-result-object v1

    invoke-virtual {v1}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 313
    return-void
.end method

.method private displaySelectedStateItemInMainView()V
    .registers 3

    .prologue
    .line 288
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 289
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v1, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogSelectedStateTxtView:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateTxtView:Landroid/widget/TextView;

    .line 290
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateTxtView:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getSelectedState()Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    move-result-object v1

    invoke-virtual {v1}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 291
    return-void
.end method

.method private displayStatesView()V
    .registers 4

    .prologue
    .line 459
    iget-boolean v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->loadingInProgress:Z

    if-nez v0, :cond_25

    .line 460
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->updateSelectedStateInStatesListView(Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;)V

    .line 461
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$anim;->bsdk_dialog_enter:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/content/Context;I)V

    .line 462
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$anim;->bsdk_dialog_exit:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/content/Context;I)V

    .line 463
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 465
    :cond_25
    return-void
.end method

.method private getAllCitiesDTO()Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
    .registers 4

    .prologue
    .line 535
    new-instance v0, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    invoke-direct {v0}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;-><init>()V

    .line 536
    .local v0, "cityDTO":Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$string;->bsdk_location_filter_dialog_city_label:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->setDisplayName(Ljava/lang/String;)V

    .line 537
    const-string v1, "ALL_CITIES_ID"

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->setId(Ljava/lang/String;)V

    .line 538
    return-object v0
.end method

.method private getAllStatesDTO()Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    .registers 4

    .prologue
    .line 520
    new-instance v0, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    invoke-direct {v0}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;-><init>()V

    .line 521
    .local v0, "stateDTO":Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$string;->bsdk_location_filter_dialog_state_label:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->setDisplayName(Ljava/lang/String;)V

    .line 522
    const-string v1, "ALL_STATES_ID"

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->setId(Ljava/lang/String;)V

    .line 523
    return-object v0
.end method

.method private getBundleArguments(Landroid/os/Bundle;)Landroid/os/Bundle;
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 245
    move-object v0, p1

    .line 246
    .local v0, "arguments":Landroid/os/Bundle;
    if-nez v0, :cond_7

    .line 247
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 249
    :cond_7
    return-object v0
.end method

.method public static getInstance()Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;
    .registers 1

    .prologue
    .line 74
    new-instance v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    invoke-direct {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;-><init>()V

    .line 75
    .local v0, "dialogInstance":Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;
    return-object v0
.end method

.method private getSelectedCity()Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
    .registers 3

    .prologue
    .line 527
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    if-nez v1, :cond_a

    .line 528
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getAllCitiesDTO()Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    move-result-object v0

    .line 529
    .local v0, "cityDTO":Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
    iput-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    .line 531
    .end local v0    # "cityDTO":Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
    :cond_a
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    return-object v1
.end method

.method private getSelectedCountry()Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    .registers 3

    .prologue
    .line 497
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    if-nez v1, :cond_a

    .line 498
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getWorldWideCountryDTO()Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    move-result-object v0

    .line 499
    .local v0, "country":Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    iput-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    .line 501
    .end local v0    # "country":Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    :cond_a
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    return-object v1
.end method

.method private getSelectedState()Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    .registers 3

    .prologue
    .line 512
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    if-nez v1, :cond_a

    .line 513
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getAllStatesDTO()Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    move-result-object v0

    .line 514
    .local v0, "stateDTO":Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    iput-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    .line 516
    .end local v0    # "stateDTO":Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    :cond_a
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    return-object v1
.end method

.method private getWorldWideCountryDTO()Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    .registers 4

    .prologue
    .line 505
    new-instance v0, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-direct {v0}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;-><init>()V

    .line 506
    .local v0, "country":Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$string;->bsdk_location_filter_dialog_country_label:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->setDisplayName(Ljava/lang/String;)V

    .line 507
    const-string v1, "WORLD_WIDE_COUNTRY_ID"

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->setId(Ljava/lang/String;)V

    .line 508
    return-object v0
.end method

.method private handleCityListItemClick(Landroid/widget/AdapterView;I)V
    .registers 6
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;I)V"
        }
    .end annotation

    .prologue
    .line 429
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1, p2}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    .line 430
    .local v0, "selectedObject":Ljava/lang/Object;
    instance-of v1, v0, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    if-eqz v1, :cond_1d

    .line 431
    check-cast v0, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    .end local v0    # "selectedObject":Ljava/lang/Object;
    iput-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    .line 432
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityTxtView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 433
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displayMainView()V

    .line 434
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->clearCitySearchResultsInDisplay()V

    .line 436
    :cond_1d
    return-void
.end method

.method private handleCountryListItemClick(Landroid/widget/AdapterView;I)V
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
    .line 391
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1, p2}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v1

    .line 392
    .local v1, "selectedObject":Ljava/lang/Object;
    instance-of v2, v1, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    if-eqz v2, :cond_3b

    .line 394
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateContainer:Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 395
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    .line 397
    check-cast v1, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    .end local v1    # "selectedObject":Ljava/lang/Object;
    iput-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    .line 398
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryTxtView:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-virtual {v3}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 399
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displayMainView()V

    .line 400
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->hideSelectedStateItemInMainView()V

    .line 401
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->hideSelectedCityItemInMainView()V

    .line 403
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getId()Ljava/lang/String;

    move-result-object v0

    .line 404
    .local v0, "id":Ljava/lang/String;
    sget-object v2, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->COUNTRY_CODES_FOR_LOAD_STATES:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 405
    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->loadStates(Ljava/lang/String;)V

    .line 410
    .end local v0    # "id":Ljava/lang/String;
    :cond_3b
    :goto_3b
    return-void

    .line 406
    .restart local v0    # "id":Ljava/lang/String;
    :cond_3c
    const-string v2, "WORLD_WIDE_COUNTRY_ID"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3b

    .line 407
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displaySelectedCityItemInMainView()V

    goto :goto_3b
.end method

.method private handleDoneClick()V
    .registers 4

    .prologue
    .line 376
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    if-eqz v0, :cond_26

    const-string v0, "ALL_CITIES_ID"

    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    invoke-virtual {v1}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_26

    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    invoke-virtual {v0}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_26

    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    invoke-virtual {v0}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_3d

    .line 377
    :cond_26
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$string;->bsdk_location_filter_dialog_city_empty_error:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 381
    :goto_3c
    return-void

    .line 379
    :cond_3d
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->notifyListenersAndCloseDialog()V

    goto :goto_3c
.end method

.method private handleStateListItemClick(Landroid/widget/AdapterView;I)V
    .registers 6
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;I)V"
        }
    .end annotation

    .prologue
    .line 413
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1, p2}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    .line 414
    .local v0, "selectedObject":Ljava/lang/Object;
    instance-of v1, v0, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    if-eqz v1, :cond_2e

    .line 415
    check-cast v0, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    .end local v0    # "selectedObject":Ljava/lang/Object;
    iput-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    .line 416
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateTxtView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 417
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displayMainView()V

    .line 418
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    .line 420
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    invoke-virtual {v1}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->getId()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ALL_STATES_ID"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2f

    .line 421
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displaySelectedCityItemInMainView()V

    .line 426
    :cond_2e
    :goto_2e
    return-void

    .line 423
    :cond_2f
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->hideSelectedCityItemInMainView()V

    goto :goto_2e
.end method

.method private hideProgressSpinner()V
    .registers 3

    .prologue
    .line 547
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->loadingInProgress:Z

    .line 548
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->progressSpinner:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 549
    return-void
.end method

.method private hideSelectedCityItemInMainView()V
    .registers 3

    .prologue
    .line 316
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    .line 317
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 318
    return-void
.end method

.method private hideSelectedStateItemInMainView()V
    .registers 3

    .prologue
    .line 294
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    .line 295
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 296
    return-void
.end method

.method private loadStates(Ljava/lang/String;)V
    .registers 3
    .param p1, "countryId"    # Ljava/lang/String;

    .prologue
    .line 552
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->showProgressSpinner()V

    .line 553
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->locationFiltersDataManager:Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->loadStates(Ljava/lang/String;)V

    .line 554
    return-void
.end method

.method private notifyListenersAndCloseDialog()V
    .registers 5

    .prologue
    .line 384
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getCallbacks()Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$Callbacks;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 385
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getCallbacks()Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$Callbacks;

    move-result-object v0

    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    iget-object v3, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    invoke-interface {v0, v1, v2, v3}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$Callbacks;->onLocationFilterDone(Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;)V

    .line 387
    :cond_13
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 388
    return-void
.end method

.method private searchForCities(Ljava/lang/String;)V
    .registers 5
    .param p1, "searchString"    # Ljava/lang/String;

    .prologue
    .line 605
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->showProgressSpinner()V

    .line 606
    const/4 v0, 0x0

    .line 607
    .local v0, "selectedCountryId":Ljava/lang/String;
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    if-eqz v2, :cond_e

    .line 608
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getId()Ljava/lang/String;

    move-result-object v0

    .line 611
    :cond_e
    const/4 v1, 0x0

    .line 612
    .local v1, "selectedStateId":Ljava/lang/String;
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    if-eqz v2, :cond_19

    .line 613
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->getId()Ljava/lang/String;

    move-result-object v1

    .line 615
    :cond_19
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->locationFiltersDataManager:Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

    invoke-virtual {v2, v0, v1, p1}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->searchForCities(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 616
    return-void
.end method

.method private setCitiesListAdapter(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 322
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;>;"
    if-eqz p1, :cond_1e

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1e

    .line 323
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 327
    .local v1, "citiesList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;>;"
    :goto_d
    new-instance v0, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    invoke-direct {v0, v2, v3, v1}, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;-><init>(Landroid/content/Context;Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;Ljava/util/List;)V

    .line 329
    .local v0, "arrayAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;, "Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter<Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;>;"
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->citiesListView:Landroid/widget/ListView;

    invoke-virtual {v2, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 330
    return-void

    .line 325
    .end local v0    # "arrayAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;, "Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter<Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;>;"
    .end local v1    # "citiesList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;>;"
    :cond_1e
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .restart local v1    # "citiesList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;>;"
    goto :goto_d
.end method

.method private showProgressSpinner()V
    .registers 3

    .prologue
    .line 542
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->loadingInProgress:Z

    .line 543
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->progressSpinner:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 544
    return-void
.end method

.method private updateSelectedCountryInCountriesListView(Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;)V
    .registers 5
    .param p1, "countryDTO"    # Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    .prologue
    .line 277
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->countriesListView:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;

    .line 278
    .local v0, "arrayAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;, "Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;"
    if-eqz v0, :cond_1c

    .line 279
    invoke-virtual {v0}, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->getSelectedLocationDTO()Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;

    move-result-object v1

    check-cast v1, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    .line 280
    .local v1, "currentSelectedItem":Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1c

    .line 281
    invoke-virtual {v0, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->setSelectedLocationDTO(Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;)V

    .line 282
    invoke-virtual {v0}, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->notifyDataSetChanged()V

    .line 285
    .end local v1    # "currentSelectedItem":Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    :cond_1c
    return-void
.end method

.method private updateSelectedStateInStatesListView(Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;)V
    .registers 5
    .param p1, "stateDTO"    # Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    .prologue
    .line 300
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->statesListView:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;

    .line 301
    .local v0, "arrayAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;, "Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;"
    if-eqz v0, :cond_1c

    .line 302
    invoke-virtual {v0}, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->getSelectedLocationDTO()Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;

    move-result-object v1

    check-cast v1, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    .line 303
    .local v1, "currentSelectedItem":Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1c

    .line 304
    invoke-virtual {v0, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->setSelectedLocationDTO(Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;)V

    .line 305
    invoke-virtual {v0}, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->notifyDataSetChanged()V

    .line 308
    .end local v1    # "currentSelectedItem":Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    :cond_1c
    return-void
.end method


# virtual methods
.method public getCallbacks()Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$Callbacks;
    .registers 2

    .prologue
    .line 650
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->callbacks:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$Callbacks;

    return-object v0
.end method

.method public onCitiesLoadingFailure(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;Ljava/lang/Exception;)V
    .registers 10
    .param p1, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x0

    .line 641
    sget-object v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v1, "Problem loading Cities for [Country id - %s] [State id - %s] [Search Str - %s]"

    new-array v2, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCountryId()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    const/4 v3, 0x1

    invoke-virtual {p1}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getStateId()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    .line 642
    invoke-virtual {p1}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCitySearchStr()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 641
    invoke-interface {v0, p2, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 643
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$string;->bsdk_location_filter_dialog_failed_to_load_error:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 644
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    if-ne v0, v6, :cond_3f

    .line 645
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->hideProgressSpinner()V

    .line 647
    :cond_3f
    return-void
.end method

.method public onCitiesLoadingSuccess(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;Ljava/util/List;)V
    .registers 5
    .param p1, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 633
    .local p2, "result":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;>;"
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_f

    .line 634
    invoke-direct {p0, p2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->setCitiesListAdapter(Ljava/util/List;)V

    .line 635
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->hideProgressSpinner()V

    .line 637
    :cond_f
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "clickedView"    # Landroid/view/View;

    .prologue
    .line 353
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .line 355
    .local v0, "clickedItemTag":Ljava/lang/Object;
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sget v2, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogCitiesSectionBackBtn:I

    if-eq v1, v2, :cond_1c

    .line 356
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sget v2, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogStatesSectionBackBtn:I

    if-eq v1, v2, :cond_1c

    .line 357
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sget v2, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogCountriesSectionBackBtn:I

    if-ne v1, v2, :cond_2b

    .line 358
    :cond_1c
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displayMainView()V

    .line 359
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sget v2, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogCitiesSectionBackBtn:I

    if-ne v1, v2, :cond_2a

    .line 360
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->clearCitySearchResultsInDisplay()V

    .line 373
    :cond_2a
    :goto_2a
    return-void

    .line 362
    :cond_2b
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sget v2, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogCloseDialogBtn:I

    if-ne v1, v2, :cond_37

    .line 363
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->handleDoneClick()V

    goto :goto_2a

    .line 364
    :cond_37
    instance-of v1, v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    if-eqz v1, :cond_2a

    .line 365
    sget-object v1, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->SHOW_COUNTRIES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    if-ne v0, v1, :cond_43

    .line 366
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displayCountriesView()V

    goto :goto_2a

    .line 367
    :cond_43
    sget-object v1, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->SHOW_STATES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    if-ne v0, v1, :cond_4b

    .line 368
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displayStatesView()V

    goto :goto_2a

    .line 369
    :cond_4b
    sget-object v1, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->SHOW_CITIES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    if-ne v0, v1, :cond_2a

    .line 370
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displayCitiesView()V

    goto :goto_2a
.end method

.method public onCountriesLoadingFailure(Ljava/lang/Exception;)V
    .registers 6
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    const/4 v3, 0x0

    .line 574
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->hideProgressSpinner()V

    .line 575
    sget-object v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v1, "Problem loading Countries list"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-interface {v0, p1, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 576
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$string;->bsdk_location_filter_dialog_failed_to_load_error:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 577
    return-void
.end method

.method public onCountriesLoadingSuccess(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 560
    .local p1, "countries":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;"
    if-eqz p1, :cond_21

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_21

    .line 561
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 566
    .local v1, "countriesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;"
    :goto_d
    new-instance v0, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-direct {v0, v2, v3, v1}, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;-><init>(Landroid/content/Context;Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;Ljava/util/List;)V

    .line 568
    .local v0, "arrayAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;, "Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;"
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->countriesListView:Landroid/widget/ListView;

    invoke-virtual {v2, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 569
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->hideProgressSpinner()V

    .line 570
    return-void

    .line 563
    .end local v0    # "arrayAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;, "Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;"
    .end local v1    # "countriesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;"
    :cond_21
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .restart local v1    # "countriesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;"
    goto :goto_d
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 84
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 85
    const/4 v0, 0x2

    sget v1, Lcom/behance/sdk/R$style;->BsdkFilterDialogTheme:I

    invoke-virtual {p0, v0, v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->setStyle(II)V

    .line 86
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 18
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 90
    sget v12, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_location_filter:I

    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {p1, v12, v0, v13}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v12

    iput-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    .line 91
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v13, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogBackBtn:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 92
    .local v2, "backButton":Landroid/view/View;
    new-instance v12, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$1;

    invoke-direct {v12, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$1;-><init>(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)V

    invoke-virtual {v2, v12}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v13, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogViewFlipper:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/ViewFlipper;

    iput-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    .line 101
    move-object/from16 v0, p3

    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getBundleArguments(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    .line 102
    .local v1, "arguments":Landroid/os/Bundle;
    const/4 v7, 0x0

    .line 104
    .local v7, "indexOfViewToDisplay":I
    if-eqz v1, :cond_6d

    .line 105
    const-string v12, "INSTANCE_STATE_KEY_LAST_DISPLAYED_CHILD_INDEX"

    const/4 v13, 0x0

    invoke-virtual {v1, v12, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v7

    .line 107
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    if-nez v12, :cond_49

    .line 108
    const-string v12, "INSTANCE_STATE_KEY_SELECTED_COUNTRY"

    invoke-virtual {v1, v12}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v9

    .line 109
    .local v9, "serializedCountry":Ljava/io/Serializable;
    instance-of v12, v9, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    if-eqz v12, :cond_49

    .line 110
    check-cast v9, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    .end local v9    # "serializedCountry":Ljava/io/Serializable;
    iput-object v9, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    .line 114
    :cond_49
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    if-nez v12, :cond_5b

    .line 115
    const-string v12, "INSTANCE_STATE_KEY_SELECTED_STATE"

    invoke-virtual {v1, v12}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v10

    .line 116
    .local v10, "serializedState":Ljava/io/Serializable;
    instance-of v12, v10, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    if-eqz v12, :cond_5b

    .line 117
    check-cast v10, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    .end local v10    # "serializedState":Ljava/io/Serializable;
    iput-object v10, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    .line 121
    :cond_5b
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    if-nez v12, :cond_6d

    .line 122
    const-string v12, "INSTANCE_STATE_KEY_SELECTED_CITY"

    invoke-virtual {v1, v12}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v8

    .line 123
    .local v8, "serializedCity":Ljava/io/Serializable;
    instance-of v12, v8, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    if-eqz v12, :cond_6d

    .line 124
    check-cast v8, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    .end local v8    # "serializedCity":Ljava/io/Serializable;
    iput-object v8, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    .line 130
    :cond_6d
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    if-eqz v12, :cond_7f

    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-virtual {v12}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getId()Ljava/lang/String;

    move-result-object v12

    const-string v13, "WORLD_WIDE_COUNTRY_ID"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_80

    .line 131
    :cond_7f
    const/4 v7, 0x1

    .line 136
    :cond_80
    if-lez v7, :cond_87

    .line 137
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v12, v7}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 140
    :cond_87
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v13, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogProgressSpinner:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    iput-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->progressSpinner:Landroid/view/View;

    .line 143
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v13, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogSelectedStateContainer:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    iput-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateContainer:Landroid/view/View;

    .line 144
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateContainer:Landroid/view/View;

    sget-object v13, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->SHOW_STATES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    invoke-virtual {v12, v13}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 145
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateContainer:Landroid/view/View;

    invoke-virtual {v12, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 147
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v13, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogStatesListView:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/ListView;

    iput-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->statesListView:Landroid/widget/ListView;

    .line 148
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->statesListView:Landroid/widget/ListView;

    new-instance v13, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$2;

    invoke-direct {v13, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$2;-><init>(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)V

    invoke-virtual {v12, v13}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 157
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v13, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogSelectedCityContainer:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    iput-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityContainer:Landroid/view/View;

    .line 158
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityContainer:Landroid/view/View;

    sget-object v13, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->SHOW_CITIES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    invoke-virtual {v12, v13}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 159
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityContainer:Landroid/view/View;

    invoke-virtual {v12, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v13, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogSelectedCityTxtView:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    iput-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityTxtView:Landroid/widget/TextView;

    .line 162
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v13, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogCitiesListView:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/ListView;

    iput-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->citiesListView:Landroid/widget/ListView;

    .line 163
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->citiesListView:Landroid/widget/ListView;

    new-instance v13, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$3;

    invoke-direct {v13, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$3;-><init>(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)V

    invoke-virtual {v12, v13}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 171
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->citiesListView:Landroid/widget/ListView;

    new-instance v13, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$4;

    invoke-direct {v13, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$4;-><init>(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)V

    invoke-virtual {v12, v13}, Landroid/widget/ListView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 181
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v13, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogCitySearchStrEditText:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/EditText;

    iput-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->citySearchStrEditText:Landroid/widget/EditText;

    .line 182
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->citySearchStrEditText:Landroid/widget/EditText;

    new-instance v13, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$5;

    invoke-direct {v13, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$5;-><init>(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)V

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 200
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->citySearchStrEditText:Landroid/widget/EditText;

    new-instance v13, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$6;

    invoke-direct {v13, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$6;-><init>(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)V

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 212
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v13, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogCloseDialogBtn:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 213
    .local v4, "closeDialogBtn":Landroid/view/View;
    invoke-virtual {v4, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 215
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v13, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogCitiesSectionBackBtn:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 216
    .local v3, "citiesSectionBackBtn":Landroid/view/View;
    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 218
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v13, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogCountriesSectionBackBtn:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 219
    .local v5, "countriesSectionBackBtn":Landroid/view/View;
    invoke-virtual {v5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 221
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    sget v13, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogStatesSectionBackBtn:I

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    .line 222
    .local v11, "statesSectionBackBtn":Landroid/view/View;
    invoke-virtual {v11, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 225
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->createCountriesListView()V

    .line 227
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    if-eqz v12, :cond_166

    .line 228
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-virtual {v12}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getId()Ljava/lang/String;

    move-result-object v6

    .line 229
    .local v6, "id":Ljava/lang/String;
    sget-object v12, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->COUNTRY_CODES_FOR_LOAD_STATES:Ljava/util/List;

    invoke-interface {v12, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_170

    .line 230
    invoke-direct {p0, v6}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->loadStates(Ljava/lang/String;)V

    .line 231
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displaySelectedStateItemInMainView()V

    .line 237
    .end local v6    # "id":Ljava/lang/String;
    :cond_166
    :goto_166
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    if-eqz v12, :cond_16d

    .line 238
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displaySelectedCityItemInMainView()V

    .line 241
    :cond_16d
    iget-object v12, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;

    return-object v12

    .line 232
    .restart local v6    # "id":Ljava/lang/String;
    :cond_170
    const-string v12, "WORLD_WIDE_COUNTRY_ID"

    invoke-virtual {v6, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_166

    .line 233
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displaySelectedCityItemInMainView()V

    goto :goto_166
.end method

.method public onDetach()V
    .registers 2

    .prologue
    .line 347
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDetach()V

    .line 348
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->locationFiltersDataManager:Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

    invoke-virtual {v0, p0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->removeListener(Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;)V

    .line 349
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    .line 334
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 336
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    .line 337
    .local v0, "displayedChild":I
    const-string v1, "INSTANCE_STATE_KEY_LAST_DISPLAYED_CHILD_INDEX"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 338
    const-string v1, "INSTANCE_STATE_KEY_SELECTED_COUNTRY"

    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCountryDTO:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 339
    const-string v1, "INSTANCE_STATE_KEY_SELECTED_STATE"

    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 340
    const-string v1, "INSTANCE_STATE_KEY_SELECTED_CITY"

    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedCityDTO:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 342
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->locationFiltersDataManager:Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

    invoke-virtual {v1, p0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->removeListener(Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;)V

    .line 343
    return-void
.end method

.method public onStart()V
    .registers 5

    .prologue
    .line 663
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onStart()V

    .line 664
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    if-eqz v2, :cond_46

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    if-eqz v2, :cond_46

    .line 665
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$bool;->bsdk_big_screen:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    if-eqz v2, :cond_46

    .line 666
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$dimen;->global_filter_dialog_width:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 667
    .local v1, "windowWidth":I
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$dimen;->global_filter_dialog_height:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 668
    .local v0, "windowHeight":I
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Landroid/view/Window;->setLayout(II)V

    .line 671
    .end local v0    # "windowHeight":I
    .end local v1    # "windowWidth":I
    :cond_46
    return-void
.end method

.method public onStatesLoadingFailure(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 7
    .param p1, "countryId"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    const/4 v3, 0x0

    .line 597
    sget-object v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v1, "Problem loading States for [Country id - %s]"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    invoke-interface {v0, p2, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 598
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$string;->bsdk_location_filter_dialog_failed_to_load_error:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 599
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->hideProgressSpinner()V

    .line 600
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->hideSelectedStateItemInMainView()V

    .line 601
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displaySelectedCityItemInMainView()V

    .line 602
    return-void
.end method

.method public onStatesLoadingSuccess(Ljava/lang/String;Ljava/util/List;)V
    .registers 7
    .param p1, "countryId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 582
    .local p2, "result":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;"
    if-eqz p2, :cond_24

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_24

    .line 583
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 588
    .local v1, "statesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;"
    :goto_d
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displaySelectedStateItemInMainView()V

    .line 589
    new-instance v0, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->selectedStateDTO:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    invoke-direct {v0, v2, v3, v1}, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;-><init>(Landroid/content/Context;Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;Ljava/util/List;)V

    .line 591
    .local v0, "arrayAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;, "Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;"
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->statesListView:Landroid/widget/ListView;

    invoke-virtual {v2, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 592
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->hideProgressSpinner()V

    .line 593
    return-void

    .line 585
    .end local v0    # "arrayAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;, "Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;"
    .end local v1    # "statesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;"
    :cond_24
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .restart local v1    # "statesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;"
    goto :goto_d
.end method

.method public setCallbacks(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$Callbacks;)V
    .registers 2
    .param p1, "callbacks"    # Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$Callbacks;

    .prologue
    .line 654
    iput-object p1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->callbacks:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$Callbacks;

    .line 655
    return-void
.end method
