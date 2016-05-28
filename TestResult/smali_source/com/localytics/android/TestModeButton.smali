.class public Lcom/localytics/android/TestModeButton;
.super Landroid/support/v4/app/DialogFragment;
.source "TestModeButton.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/TestModeButton$TestModeDialog;
    }
.end annotation


# instance fields
.field private mCallbacks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/localytics/android/AmpCallable;",
            ">;"
        }
    .end annotation
.end field

.field private mEnterAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 56
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 57
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/localytics/android/TestModeButton;->mEnterAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 58
    return-void
.end method

.method static synthetic access$200(Lcom/localytics/android/TestModeButton;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/TestModeButton;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/localytics/android/TestModeButton;->mCallbacks:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$300(Lcom/localytics/android/TestModeButton;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/TestModeButton;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/localytics/android/TestModeButton;->mEnterAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method public static newInstance()Lcom/localytics/android/TestModeButton;
    .registers 2

    .prologue
    .line 196
    new-instance v0, Lcom/localytics/android/TestModeButton;

    invoke-direct {v0}, Lcom/localytics/android/TestModeButton;-><init>()V

    .line 197
    .local v0, "fragment":Lcom/localytics/android/TestModeButton;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/localytics/android/TestModeButton;->setRetainInstance(Z)V

    .line 198
    return-object v0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    .line 63
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 65
    const-string v0, "TestModeButton"

    const-string v1, "onActivityCreated"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    :cond_b
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 68
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 73
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 75
    const-string v0, "TestModeButton"

    const-string v1, "onAttach"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    :cond_b
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 78
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 83
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 85
    const-string v0, "TestModeButton"

    const-string v1, "onCreate"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    :cond_b
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 88
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 204
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 206
    const-string v0, "TestModeButton"

    const-string v1, "onCreateDialog"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    :cond_b
    new-instance v0, Lcom/localytics/android/TestModeButton$TestModeDialog;

    invoke-virtual {p0}, Lcom/localytics/android/TestModeButton;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x103000b

    invoke-direct {v0, p0, v1, v2}, Lcom/localytics/android/TestModeButton$TestModeDialog;-><init>(Lcom/localytics/android/TestModeButton;Landroid/content/Context;I)V

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 184
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 186
    const-string v0, "TestModeButton"

    const-string v1, "onCreateView"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    :cond_b
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/DialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 143
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 145
    const-string v0, "TestModeButton"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    :cond_b
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDestroy()V

    .line 148
    return-void
.end method

.method public onDestroyView()V
    .registers 3

    .prologue
    .line 214
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 216
    const-string v0, "TestModeButton"

    const-string v1, "onDestroyView"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    :cond_b
    invoke-virtual {p0}, Lcom/localytics/android/TestModeButton;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Lcom/localytics/android/TestModeButton;->getRetainInstance()Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 220
    invoke-virtual {p0}, Lcom/localytics/android/TestModeButton;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 222
    :cond_1f
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDestroyView()V

    .line 223
    return-void
.end method

.method public onDetach()V
    .registers 3

    .prologue
    .line 93
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 95
    const-string v0, "TestModeButton"

    const-string v1, "onDetach"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    :cond_b
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDetach()V

    .line 98
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 103
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 105
    const-string v0, "TestModeButton"

    const-string v1, "onDismiss"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    :cond_b
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 108
    return-void
.end method

.method public onPause()V
    .registers 3

    .prologue
    .line 123
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 125
    const-string v0, "TestModeButton"

    const-string v1, "onPause"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    :cond_b
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onPause()V

    .line 128
    return-void
.end method

.method public onResume()V
    .registers 3

    .prologue
    .line 133
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 135
    const-string v0, "AmpTestButtonFragment"

    const-string v1, "onResume"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    :cond_b
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onResume()V

    .line 138
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    .line 173
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 175
    const-string v0, "TestModeButton"

    const-string v1, "onSaveInstanceState"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    :cond_b
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 178
    return-void
.end method

.method public onStart()V
    .registers 3

    .prologue
    .line 113
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 115
    const-string v0, "TestModeButton"

    const-string v1, "onStart"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    :cond_b
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onStart()V

    .line 118
    return-void
.end method

.method public onStop()V
    .registers 3

    .prologue
    .line 153
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 155
    const-string v0, "TestModeButton"

    const-string v1, "onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    :cond_b
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onStop()V

    .line 158
    return-void
.end method

.method public onViewStateRestored(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 163
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 165
    const-string v0, "TestModeButton"

    const-string v1, "onViewStateRestored"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    :cond_b
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onViewStateRestored(Landroid/os/Bundle;)V

    .line 168
    return-void
.end method

.method public setCallbacks(Ljava/util/Map;)Lcom/localytics/android/TestModeButton;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/localytics/android/AmpCallable;",
            ">;)",
            "Lcom/localytics/android/TestModeButton;"
        }
    .end annotation

    .prologue
    .line 234
    .local p1, "callbacks":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/localytics/android/AmpCallable;>;"
    iput-object p1, p0, Lcom/localytics/android/TestModeButton;->mCallbacks:Ljava/util/Map;

    .line 235
    return-object p0
.end method

.method public show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V
    .registers 5
    .param p1, "manager"    # Landroid/support/v4/app/FragmentManager;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 228
    iget-object v0, p0, Lcom/localytics/android/TestModeButton;->mEnterAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 229
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/DialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 230
    return-void
.end method
