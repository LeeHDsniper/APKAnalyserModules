.class public Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "BehanceSDKEditProfileActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;
.implements Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$Callbacks;
.implements Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;
.implements Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private avatar:Landroid/widget/ImageView;

.field private companyET:Landroid/widget/EditText;

.field private editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

.field private enableAlternateImageSelectionSources:Z

.field private firstNameET:Landroid/widget/EditText;

.field private lastNameET:Landroid/widget/EditText;

.field private location:Landroid/widget/TextView;

.field private mLoader:Lcom/nostra13/universalimageloader/core/ImageLoader;

.field private occupationET:Landroid/widget/EditText;

.field private profileChanged:Z

.field private progressBar:Landroid/view/View;

.field private saveNavBtn:Landroid/widget/TextView;

.field private unsavedChangesAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

.field private websiteET:Landroid/widget/EditText;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 48
    const-class v0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 46
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 71
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->profileChanged:Z

    .line 72
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->enableAlternateImageSelectionSources:Z

    return-void
.end method

.method private closeThisActivity()V
    .registers 1

    .prologue
    .line 174
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->finish()V

    .line 175
    return-void
.end method

.method private closeUnsavedChangesAlertDialog()V
    .registers 2

    .prologue
    .line 260
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->unsavedChangesAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    if-eqz v0, :cond_9

    .line 261
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->unsavedChangesAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->dismiss()V

    .line 262
    :cond_9
    return-void
.end method

.method private displayNoInternetConnectivity()V
    .registers 3

    .prologue
    .line 169
    sget v0, Lcom/behance/sdk/R$string;->bsdk_add_wip_view_connection_error_msg:I

    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 170
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->closeThisActivity()V

    .line 171
    return-void
.end method

.method private getImageLoaderInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;
    .registers 4

    .prologue
    .line 146
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    .line 147
    .local v0, "instance":Lcom/nostra13/universalimageloader/core/ImageLoader;
    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->isInited()Z

    move-result v2

    if-nez v2, :cond_11

    .line 148
    invoke-static {p0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;->createDefault(Landroid/content/Context;)Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;

    move-result-object v1

    .line 149
    .local v1, "loaderConfiguration":Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->init(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;)V

    .line 151
    .end local v1    # "loaderConfiguration":Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
    :cond_11
    return-object v0
.end method

.method private handleLocationClick()V
    .registers 5

    .prologue
    .line 265
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 266
    .local v1, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-static {}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getInstance()Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    move-result-object v2

    .line 267
    .local v2, "instance":Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 268
    .local v0, "bundle":Landroid/os/Bundle;
    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->setSelectedLocation(Landroid/os/Bundle;)V

    .line 269
    invoke-virtual {v2, v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->setArguments(Landroid/os/Bundle;)V

    .line 270
    invoke-virtual {v2, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->setCallbacks(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$Callbacks;)V

    .line 271
    const-string v3, "FRAGMENT_TAG_EDIT_PROFILE_LOCATION"

    invoke-virtual {v2, v1, v3}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 272
    return-void
.end method

.method private hideProgressBar()V
    .registers 3

    .prologue
    .line 183
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->progressBar:Landroid/view/View;

    if-eqz v0, :cond_b

    .line 184
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->progressBar:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 185
    :cond_b
    return-void
.end method

.method private initializeFields()V
    .registers 5

    .prologue
    .line 335
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->firstNameET:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getFirstName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 336
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->lastNameET:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getLastName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 337
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->occupationET:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getOccupation()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 338
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->companyET:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getCompany()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 339
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->websiteET:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getWebsite()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 341
    const-string v0, ""

    .line 342
    .local v0, "locationText":Ljava/lang/String;
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getCountry()Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    move-result-object v1

    if-eqz v1, :cond_5c

    .line 343
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getCountry()Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    move-result-object v2

    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 344
    :cond_5c
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getState()Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    move-result-object v1

    if-eqz v1, :cond_85

    .line 345
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getState()Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    move-result-object v2

    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 346
    :cond_85
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getCity()Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    move-result-object v1

    if-eqz v1, :cond_ae

    .line 347
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getCity()Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    move-result-object v2

    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 348
    :cond_ae
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->location:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 350
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getImageBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-nez v1, :cond_ec

    .line 351
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->mLoader:Lcom/nostra13/universalimageloader/core/ImageLoader;

    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getOriginalImageUrl()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->avatar:Landroid/widget/ImageView;

    invoke-virtual {v1, v2, v3}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 355
    :goto_c8
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->firstNameET:Landroid/widget/EditText;

    invoke-virtual {v1, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 356
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->lastNameET:Landroid/widget/EditText;

    invoke-virtual {v1, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 357
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->occupationET:Landroid/widget/EditText;

    invoke-virtual {v1, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 358
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->companyET:Landroid/widget/EditText;

    invoke-virtual {v1, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 359
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->websiteET:Landroid/widget/EditText;

    invoke-virtual {v1, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 360
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->avatar:Landroid/widget/ImageView;

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 361
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->location:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 362
    return-void

    .line 353
    :cond_ec
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->avatar:Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getImageBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_c8
.end method

.method private isStringEmpty(Ljava/lang/String;)Z
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 327
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_e

    .line 328
    const/4 v0, 0x0

    .line 330
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x1

    goto :goto_d
.end method

.method private launchAlbumsViewToPickPicture()V
    .registers 7

    .prologue
    .line 188
    invoke-static {}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getSingleImageSelectionOptions()Lcom/behance/sdk/BehanceSDKImageSelectorOptions;

    move-result-object v2

    .line 189
    .local v2, "imageSelectionOptions":Lcom/behance/sdk/BehanceSDKImageSelectorOptions;
    iget-boolean v5, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->enableAlternateImageSelectionSources:Z

    if-nez v5, :cond_b

    .line 190
    invoke-virtual {v2}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->hideImageSelectionSources()V

    .line 192
    :cond_b
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKUtils;->getAllowedFileExtensionsForProfileImage()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setAllowedFileExtensions(Ljava/util/ArrayList;)V

    .line 193
    invoke-static {p0, v2}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getInstance(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;Lcom/behance/sdk/BehanceSDKImageSelectorOptions;)Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    move-result-object v4

    .line 195
    .local v4, "selectImageDialog":Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 196
    .local v0, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 197
    .local v1, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    const-string v5, "FRAGMENT_TAG_EDIT_PROFILE_SELECT_IMAGE"

    invoke-virtual {v0, v5}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    .line 198
    .local v3, "previousInstance":Landroid/support/v4/app/Fragment;
    if-eqz v3, :cond_29

    .line 199
    invoke-virtual {v1, v3}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 201
    :cond_29
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 202
    const-string v5, "FRAGMENT_TAG_EDIT_PROFILE_SELECT_IMAGE"

    invoke-virtual {v4, v1, v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->show(Landroid/support/v4/app/FragmentTransaction;Ljava/lang/String;)I

    .line 203
    return-void
.end method

.method private saveChanges()V
    .registers 11

    .prologue
    .line 286
    iget-boolean v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->profileChanged:Z

    if-eqz v7, :cond_7a

    .line 287
    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->firstNameET:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 288
    .local v2, "firstNameStr":Ljava/lang/String;
    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->lastNameET:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 289
    .local v3, "lastNameStr":Ljava/lang/String;
    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->occupationET:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 290
    .local v5, "occupationStr":Ljava/lang/String;
    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->companyET:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 291
    .local v1, "companyStr":Ljava/lang/String;
    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->websiteET:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 293
    .local v6, "websiteStr":Ljava/lang/String;
    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v7, v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setFirstName(Ljava/lang/String;)V

    .line 294
    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v7, v3}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setLastName(Ljava/lang/String;)V

    .line 295
    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v7, v5}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setOccupation(Ljava/lang/String;)V

    .line 296
    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v7, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setCompany(Ljava/lang/String;)V

    .line 297
    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v7, v6}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setWebsite(Ljava/lang/String;)V

    .line 299
    const/4 v0, 0x1

    .line 300
    .local v0, "allFieldsValid":Z
    sget v4, Lcom/behance/sdk/R$string;->bsdk_edit_profile_avatar_required_fields_missing_msg:I

    .line 302
    .local v4, "msgToDisplayResourceId":I
    invoke-direct {p0, v2}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->isStringEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7b

    invoke-direct {p0, v3}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->isStringEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7b

    .line 303
    const/4 v0, 0x0

    .line 304
    sget v4, Lcom/behance/sdk/R$string;->bsdk_edit_profile_avatar_required_fields_missing_msg:I

    .line 316
    :cond_61
    :goto_61
    if-eqz v0, :cond_9b

    .line 317
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->showProgressBar()V

    .line 318
    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->saveNavBtn:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sget v9, Lcom/behance/sdk/R$color;->bsdk_adobe_blue_disabled:I

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 319
    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v7}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->saveUserPortfolioChanges()V

    .line 324
    .end local v0    # "allFieldsValid":Z
    .end local v1    # "companyStr":Ljava/lang/String;
    .end local v2    # "firstNameStr":Ljava/lang/String;
    .end local v3    # "lastNameStr":Ljava/lang/String;
    .end local v4    # "msgToDisplayResourceId":I
    .end local v5    # "occupationStr":Ljava/lang/String;
    .end local v6    # "websiteStr":Ljava/lang/String;
    :cond_7a
    :goto_7a
    return-void

    .line 305
    .restart local v0    # "allFieldsValid":Z
    .restart local v1    # "companyStr":Ljava/lang/String;
    .restart local v2    # "firstNameStr":Ljava/lang/String;
    .restart local v3    # "lastNameStr":Ljava/lang/String;
    .restart local v4    # "msgToDisplayResourceId":I
    .restart local v5    # "occupationStr":Ljava/lang/String;
    .restart local v6    # "websiteStr":Ljava/lang/String;
    :cond_7b
    invoke-direct {p0, v2}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->isStringEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_85

    .line 306
    const/4 v0, 0x0

    .line 307
    sget v4, Lcom/behance/sdk/R$string;->bsdk_edit_profile_avatar_first_name_field_missing_msg:I

    goto :goto_61

    .line 308
    :cond_85
    invoke-direct {p0, v3}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->isStringEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8f

    .line 309
    const/4 v0, 0x0

    .line 310
    sget v4, Lcom/behance/sdk/R$string;->bsdk_edit_profile_avatar_last_name_field_missing_msg:I

    goto :goto_61

    .line 311
    :cond_8f
    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v7}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->isValidLocation()Z

    move-result v7

    if-nez v7, :cond_61

    .line 312
    const/4 v0, 0x0

    .line 313
    sget v4, Lcom/behance/sdk/R$string;->bsdk_location_filter_dialog_city_empty_error:I

    goto :goto_61

    .line 321
    :cond_9b
    const/4 v7, 0x1

    invoke-static {p0, v4, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    goto :goto_7a
.end method

.method private setSelectedLocation(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 275
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getCountry()Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    move-result-object v0

    if-eqz v0, :cond_39

    .line 276
    const-string v0, "INSTANCE_STATE_KEY_SELECTED_COUNTRY"

    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getCountry()Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 277
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getState()Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    move-result-object v0

    if-eqz v0, :cond_26

    .line 278
    const-string v0, "INSTANCE_STATE_KEY_SELECTED_STATE"

    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getState()Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 279
    :cond_26
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getCity()Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    move-result-object v0

    if-eqz v0, :cond_39

    .line 280
    const-string v0, "INSTANCE_STATE_KEY_SELECTED_CITY"

    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getCity()Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 283
    :cond_39
    return-void
.end method

.method private showProgressBar()V
    .registers 3

    .prologue
    .line 178
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->progressBar:Landroid/view/View;

    if-eqz v0, :cond_a

    .line 179
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->progressBar:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 180
    :cond_a
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 5
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 376
    iget-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->profileChanged:Z

    if-nez v0, :cond_16

    .line 377
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->profileChanged:Z

    .line 378
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->saveNavBtn:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$color;->bsdk_adobe_blue:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 380
    :cond_16
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 367
    return-void
.end method

.method public onBackPressed()V
    .registers 5

    .prologue
    .line 156
    iget-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->profileChanged:Z

    if-eqz v0, :cond_22

    .line 157
    sget v0, Lcom/behance/sdk/R$string;->bsdk_edit_profile_unsaved_changes_title:I

    sget v1, Lcom/behance/sdk/R$string;->bsdk_edit_profile_unsaved_changes_body:I

    sget v2, Lcom/behance/sdk/R$string;->bsdk_generic_alert_dialog_ok_btn_label:I

    sget v3, Lcom/behance/sdk/R$string;->bsdk_generic_alert_dialog_cancel_btn_label:I

    invoke-static {p0, v0, v1, v2, v3}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->getInstance(Landroid/content/Context;IIII)Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->unsavedChangesAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    .line 160
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->unsavedChangesAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 161
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->unsavedChangesAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnNotOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->unsavedChangesAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->show()V

    .line 166
    :goto_21
    return-void

    .line 164
    :cond_22
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onBackPressed()V

    goto :goto_21
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 244
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 245
    .local v0, "i":I
    sget v1, Lcom/behance/sdk/R$id;->bsdkEditProfileActionbarBackBtnImageView:I

    if-ne v0, v1, :cond_c

    .line 246
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->onBackPressed()V

    .line 257
    :cond_b
    :goto_b
    return-void

    .line 247
    :cond_c
    sget v1, Lcom/behance/sdk/R$id;->bsdkEditProfileActionbarActionBtnTxtView:I

    if-ne v0, v1, :cond_14

    .line 248
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->saveChanges()V

    goto :goto_b

    .line 249
    :cond_14
    sget v1, Lcom/behance/sdk/R$id;->bsdkEditProfileAvatar:I

    if-ne v0, v1, :cond_1c

    .line 250
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->launchAlbumsViewToPickPicture()V

    goto :goto_b

    .line 251
    :cond_1c
    sget v1, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogOKBtn:I

    if-ne v0, v1, :cond_24

    .line 252
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->closeThisActivity()V

    goto :goto_b

    .line 253
    :cond_24
    sget v1, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogNotOKBtn:I

    if-ne v0, v1, :cond_2c

    .line 254
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->closeUnsavedChangesAlertDialog()V

    goto :goto_b

    .line 255
    :cond_2c
    sget v1, Lcom/behance/sdk/R$id;->bsdkEditProfileLocation:I

    if-ne v0, v1, :cond_b

    .line 256
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->handleLocationClick()V

    goto :goto_b
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 11
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x1

    .line 85
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 86
    sget v6, Lcom/behance/sdk/R$layout;->bsdk_activity_edit_profile:I

    invoke-virtual {p0, v6}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->setContentView(I)V

    .line 88
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    .line 89
    .local v4, "intent":Landroid/content/Intent;
    if-eqz v4, :cond_fe

    .line 90
    const-string v6, "INTENT_EXTRA_BOOLEAN_ENABLE_ALTERNATE_IMAGE_SELECTION_SOURCES"

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    iput-boolean v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->enableAlternateImageSelectionSources:Z

    .line 95
    :goto_17
    sget v6, Lcom/behance/sdk/R$id;->bsdkEditProfileActionbarBackBtnImageView:I

    invoke-virtual {p0, v6}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 96
    .local v0, "backNavBtn":Landroid/view/View;
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    sget v6, Lcom/behance/sdk/R$id;->bsdkEditProfileActionbarActionBtnTxtView:I

    invoke-virtual {p0, v6}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->saveNavBtn:Landroid/widget/TextView;

    .line 99
    iget-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->saveNavBtn:Landroid/widget/TextView;

    invoke-virtual {v6, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    sget v6, Lcom/behance/sdk/R$id;->bsdkEditProfileLoader:I

    invoke-virtual {p0, v6}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->progressBar:Landroid/view/View;

    .line 103
    sget v6, Lcom/behance/sdk/R$id;->bsdkEditProfileFirstName:I

    invoke-virtual {p0, v6}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->firstNameET:Landroid/widget/EditText;

    .line 104
    sget v6, Lcom/behance/sdk/R$id;->bsdkEditProfileLastName:I

    invoke-virtual {p0, v6}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->lastNameET:Landroid/widget/EditText;

    .line 105
    sget v6, Lcom/behance/sdk/R$id;->bsdkEditProfileOccupation:I

    invoke-virtual {p0, v6}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->occupationET:Landroid/widget/EditText;

    .line 106
    sget v6, Lcom/behance/sdk/R$id;->bsdkEditProfileCompany:I

    invoke-virtual {p0, v6}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->companyET:Landroid/widget/EditText;

    .line 107
    sget v6, Lcom/behance/sdk/R$id;->bsdkEditProfileWebsite:I

    invoke-virtual {p0, v6}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->websiteET:Landroid/widget/EditText;

    .line 108
    sget v6, Lcom/behance/sdk/R$id;->bsdkEditProfileAvatar:I

    invoke-virtual {p0, v6}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    iput-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->avatar:Landroid/widget/ImageView;

    .line 109
    sget v6, Lcom/behance/sdk/R$id;->bsdkEditProfileLocation:I

    invoke-virtual {p0, v6}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->location:Landroid/widget/TextView;

    .line 111
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getImageLoaderInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v6

    iput-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->mLoader:Lcom/nostra13/universalimageloader/core/ImageLoader;

    .line 113
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v6

    const-string v7, "EDIT_PROFILE_HEADLESS_FRAGMENT_TAG"

    invoke-virtual {v6, v7}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v6

    check-cast v6, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    iput-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    .line 114
    iget-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    if-nez v6, :cond_102

    .line 115
    new-instance v6, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-direct {v6}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;-><init>()V

    iput-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    .line 116
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v6

    iget-object v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    const-string v8, "EDIT_PROFILE_HEADLESS_FRAGMENT_TAG"

    invoke-virtual {v6, v7, v8}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 118
    iget-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v6}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->loadUserDetailsFromServer()V

    .line 123
    :goto_b4
    iget-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v6, p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setCallbacks(Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;)V

    .line 125
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 126
    .local v1, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    const-string v6, "FRAGMENT_TAG_EDIT_PROFILE_SELECT_IMAGE"

    invoke-virtual {v1, v6}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    .line 127
    .local v2, "imageChooserFragmentInstance":Landroid/support/v4/app/Fragment;
    instance-of v6, v2, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    if-eqz v6, :cond_cc

    .line 128
    check-cast v2, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    .end local v2    # "imageChooserFragmentInstance":Landroid/support/v4/app/Fragment;
    invoke-virtual {v2, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;)V

    .line 130
    :cond_cc
    const-string v6, "FRAGMENT_TAG_EDIT_PROFILE_CROP_IMAGE"

    invoke-virtual {v1, v6}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    .line 131
    .local v3, "imageCropperFragmentInstance":Landroid/support/v4/app/Fragment;
    instance-of v6, v3, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;

    if-eqz v6, :cond_db

    .line 132
    check-cast v3, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;

    .end local v3    # "imageCropperFragmentInstance":Landroid/support/v4/app/Fragment;
    invoke-virtual {v3, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;)V

    .line 134
    :cond_db
    const-string v6, "FRAGMENT_TAG_EDIT_PROFILE_LOCATION"

    invoke-virtual {v1, v6}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v5

    .line 135
    .local v5, "locationFilterFragmentInstance":Landroid/support/v4/app/Fragment;
    instance-of v6, v5, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    if-eqz v6, :cond_ea

    .line 136
    check-cast v5, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    .end local v5    # "locationFilterFragmentInstance":Landroid/support/v4/app/Fragment;
    invoke-virtual {v5, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->setCallbacks(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$Callbacks;)V

    .line 139
    :cond_ea
    iget-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v6}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->isGetUserProfileTaskInProgress()Z

    move-result v6

    if-nez v6, :cond_fa

    iget-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v6}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->isEditProfileTaskInProgress()Z

    move-result v6

    if-eqz v6, :cond_fd

    .line 140
    :cond_fa
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->showProgressBar()V

    .line 141
    :cond_fd
    return-void

    .line 92
    .end local v0    # "backNavBtn":Landroid/view/View;
    .end local v1    # "fragmentManager":Landroid/support/v4/app/FragmentManager;
    :cond_fe
    iput-boolean v7, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->enableAlternateImageSelectionSources:Z

    goto/16 :goto_17

    .line 120
    .restart local v0    # "backNavBtn":Landroid/view/View;
    :cond_102
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->initializeFields()V

    .line 121
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->hideProgressBar()V

    goto :goto_b4
.end method

.method public onEditProfileFailure(Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;)V
    .registers 9
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;

    .prologue
    const/4 v6, 0x1

    .line 403
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->getExceptions()Ljava/util/List;

    move-result-object v1

    .line 404
    .local v1, "resultExceptions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    if-eqz v1, :cond_22

    .line 405
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Exception;

    .line 406
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v4, "Problem updating user profile"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-interface {v3, v0, v4, v5}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_b

    .line 409
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_22
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->isProfileUpdateFailed()Z

    move-result v2

    if-eqz v2, :cond_40

    .line 410
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$string;->bsdk_edit_profile_editing_error:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 419
    :goto_39
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->hideProgressBar()V

    .line 420
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->closeThisActivity()V

    .line 421
    return-void

    .line 411
    :cond_40
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->isProfileAvatarUpdateFailed()Z

    move-result v2

    if-eqz v2, :cond_5f

    .line 412
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$string;->bsdk_edit_profile_avatar_saving_error:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 414
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;->onEditProfileSuccess()V

    goto :goto_39

    .line 417
    :cond_5f
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$string;->bsdk_edit_profile_editing_error:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_39
.end method

.method public onEditProfileSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;)V
    .registers 3
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;

    .prologue
    .line 397
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;->onEditProfileSuccess()V

    .line 398
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->closeThisActivity()V

    .line 399
    return-void
.end method

.method public onGetUserProfileFailure(Ljava/lang/Exception;Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;)V
    .registers 6
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;

    .prologue
    .line 390
    sget-object v0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v1, "Problem retrieving user Profile details"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, p1, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 391
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/behance/sdk/R$string;->bsdk_edit_profile_loading_error:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 392
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->closeThisActivity()V

    .line 393
    return-void
.end method

.method public onGetUserProfileSuccess()V
    .registers 1

    .prologue
    .line 384
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->initializeFields()V

    .line 385
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->hideProgressBar()V

    .line 386
    return-void
.end method

.method public onImageCropped(Landroid/graphics/Bitmap;)V
    .registers 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 425
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 426
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->avatar:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 427
    iget-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->profileChanged:Z

    if-nez v0, :cond_20

    .line 428
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->profileChanged:Z

    .line 429
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->saveNavBtn:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$color;->bsdk_adobe_blue:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 431
    :cond_20
    return-void
.end method

.method public onImageSelectorOnError(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 240
    return-void
.end method

.method public onImageSelectorSelectionBackPressed()V
    .registers 1

    .prologue
    .line 236
    return-void
.end method

.method public onImageSelectorSelectionCanceled()V
    .registers 1

    .prologue
    .line 231
    return-void
.end method

.method public onImageSelectorSelectionFinished(Ljava/util/List;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "selectedImageModulesList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    const/16 v7, 0x114

    .line 207
    if-eqz p1, :cond_4b

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_4b

    .line 208
    const/4 v6, 0x0

    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/behance/sdk/project/modules/ImageModule;

    .line 209
    .local v4, "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    new-instance v1, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;

    invoke-direct {v1}, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;-><init>()V

    .line 210
    .local v1, "cropperDTO":Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;
    invoke-virtual {v1, v7}, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->setHeight(I)V

    .line 211
    invoke-virtual {v1, v7}, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->setWidth(I)V

    .line 212
    invoke-virtual {v1, v7}, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->setMinSize(I)V

    .line 213
    invoke-virtual {v1, v4}, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->setImageModule(Lcom/behance/sdk/project/modules/ImageModule;)V

    .line 214
    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->setIncludeControls(Z)V

    .line 215
    invoke-static {v1, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->getInstance(Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;)Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;

    move-result-object v0

    .line 216
    .local v0, "cropImageDialog":Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    .line 217
    .local v2, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    .line 218
    .local v3, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    const-string v6, "FRAGMENT_TAG_EDIT_PROFILE_CROP_IMAGE"

    invoke-virtual {v2, v6}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v5

    .line 219
    .local v5, "previousInstance":Landroid/support/v4/app/Fragment;
    if-eqz v5, :cond_3d

    .line 220
    invoke-virtual {v3, v5}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 222
    :cond_3d
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 223
    const-string v6, "FRAGMENT_TAG_EDIT_PROFILE_CROP_IMAGE"

    invoke-virtual {v0, v3, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->show(Landroid/support/v4/app/FragmentTransaction;Ljava/lang/String;)I

    .line 224
    iget-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v6, v4}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setImage(Lcom/behance/sdk/project/modules/ImageModule;)V

    .line 226
    .end local v0    # "cropImageDialog":Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;
    .end local v1    # "cropperDTO":Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;
    .end local v2    # "fragmentManager":Landroid/support/v4/app/FragmentManager;
    .end local v3    # "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    .end local v4    # "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    .end local v5    # "previousInstance":Landroid/support/v4/app/Fragment;
    :cond_4b
    return-void
.end method

.method public onLocationFilterDone(Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;)V
    .registers 8
    .param p1, "selectedCountry"    # Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    .param p2, "selectedState"    # Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    .param p3, "selectedCity"    # Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    .prologue
    .line 435
    const-string v0, ""

    .line 436
    .local v0, "locationText":Ljava/lang/String;
    if-eqz p1, :cond_34

    .line 437
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v1, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setCountry(Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;)V

    .line 438
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 439
    iget-boolean v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->profileChanged:Z

    if-nez v1, :cond_34

    .line 440
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->profileChanged:Z

    .line 441
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->saveNavBtn:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$color;->bsdk_adobe_blue:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 444
    :cond_34
    if-eqz p2, :cond_7e

    .line 445
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v1, p2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setState(Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;)V

    .line 446
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 452
    :goto_56
    if-eqz p3, :cond_78

    .line 453
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    invoke-virtual {v1, p3}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setCity(Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;)V

    .line 454
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p3}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 456
    :cond_78
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->location:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 457
    return-void

    .line 449
    :cond_7e
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->editProfileHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setState(Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;)V

    goto :goto_56
.end method

.method public onStart()V
    .registers 3

    .prologue
    .line 76
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStart()V

    .line 77
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 78
    .local v0, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_17

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-nez v1, :cond_1a

    .line 79
    :cond_17
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKEditProfileActivity;->displayNoInternetConnectivity()V

    .line 81
    :cond_1a
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 372
    return-void
.end method
