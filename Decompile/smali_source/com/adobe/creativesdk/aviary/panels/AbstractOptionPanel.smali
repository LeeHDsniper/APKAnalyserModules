.class abstract Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
.source "AbstractOptionPanel.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OptionPanel;


# instance fields
.field protected mOptionView:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 3
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 24
    return-void
.end method


# virtual methods
.method protected varargs disableHapticIsNecessary([Lcom/adobe/android/ui/widget/VibrationWidget;)V
    .registers 8
    .param p1, "views"    # [Lcom/adobe/android/ui/widget/VibrationWidget;

    .prologue
    .line 69
    const/4 v2, 0x1

    .line 71
    .local v2, "vibration":Z
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v4

    const-class v5, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 73
    .local v0, "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    const-string v4, "tools-vibration-disabled"

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentHasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_22

    .line 74
    const/4 v2, 0x0

    .line 83
    :cond_16
    :goto_16
    array-length v5, p1

    const/4 v4, 0x0

    :goto_18
    if-ge v4, v5, :cond_43

    aget-object v3, p1, v4

    .line 84
    .local v3, "view":Lcom/adobe/android/ui/widget/VibrationWidget;
    invoke-interface {v3, v2}, Lcom/adobe/android/ui/widget/VibrationWidget;->setVibrationEnabled(Z)V

    .line 83
    add-int/lit8 v4, v4, 0x1

    goto :goto_18

    .line 77
    .end local v3    # "view":Lcom/adobe/android/ui/widget/VibrationWidget;
    :cond_22
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v4

    if-eqz v4, :cond_16

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v4

    if-eqz v4, :cond_16

    .line 78
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v1

    .line 79
    .local v1, "preferencesUtils":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->hasVibrationEnabled()Z

    move-result v2

    goto :goto_16

    .line 86
    .end local v1    # "preferencesUtils":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    :cond_43
    return-void
.end method

.method protected abstract generateOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
.end method

.method public bridge synthetic getOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 4

    .prologue
    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->getOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;

    move-result-object v0

    return-object v0
.end method

.method public final getOptionView()Landroid/view/ViewGroup;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->mOptionView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public final getOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .registers 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 28
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->generateOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->mOptionView:Landroid/view/ViewGroup;

    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->mOptionView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method protected onDispose()V
    .registers 2

    .prologue
    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->mOptionView:Landroid/view/ViewGroup;

    .line 45
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onDispose()V

    .line 46
    return-void
.end method

.method public setEnabled(Z)V
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 50
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setEnabled(Z)V

    .line 51
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->setEnabled(Z)V

    .line 52
    return-void
.end method
