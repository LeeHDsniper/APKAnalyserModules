.class public abstract Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;
.source "AbstractSeekbarOptionPanel.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# instance fields
.field mSeekBar:Landroid/widget/SeekBar;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V
    .registers 5
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .param p3, "type"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 21
    invoke-static {p3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    .line 22
    return-void
.end method


# virtual methods
.method protected generateOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .registers 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 66
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_panel_seekbar:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public onActivate()V
    .registers 2

    .prologue
    .line 42
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onActivate()V

    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 44
    return-void
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 26
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 28
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->seekbar:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/SeekBar;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->mSeekBar:Landroid/widget/SeekBar;

    .line 30
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->hasAccentColor()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 31
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getAccentColor(I)I

    move-result v0

    .line 32
    .local v0, "accentColor":I
    if-eqz v0, :cond_2b

    .line 33
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->mSeekBar:Landroid/widget/SeekBar;

    invoke-static {v1, v0}, Lcom/adobe/android/ui/utils/UIUtils;->setSeekBarProgressTint(Landroid/widget/SeekBar;I)Z

    .line 37
    .end local v0    # "accentColor":I
    :cond_2b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->mSeekBar:Landroid/widget/SeekBar;

    const/16 v2, 0x32

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 38
    return-void
.end method

.method public onDeactivate()V
    .registers 3

    .prologue
    .line 48
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onDeactivate()V

    .line 49
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->mSeekBar:Landroid/widget/SeekBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 50
    return-void
.end method

.method public final onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 4
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 71
    invoke-virtual {p0, p2, p3}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->onSliderChanged(IZ)V

    .line 72
    return-void
.end method

.method protected abstract onSliderChanged(IZ)V
.end method

.method protected abstract onSliderEnd(I)V
.end method

.method protected abstract onSliderStart(I)V
.end method

.method public final onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 3
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 76
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->onSliderStart(I)V

    .line 77
    return-void
.end method

.method public final onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 3
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 81
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->onSliderEnd(I)V

    .line 82
    return-void
.end method

.method public bridge synthetic setEnabled(Z)V
    .registers 2

    .prologue
    .line 16
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->setEnabled(Z)V

    return-void
.end method

.method protected setValue(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 54
    return-void
.end method
