.class Lcom/google/android/gms/internal/zzfk$1$1;
.super Landroid/webkit/WebViewClient;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfk$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzBI:Lcom/google/android/gms/internal/zzfk$1;

.field final synthetic zzrZ:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfk$1;Landroid/webkit/WebView;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfk$1$1;->zzBI:Lcom/google/android/gms/internal/zzfk$1;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfk$1$1;->zzrZ:Landroid/webkit/WebView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const-string v0, "Loading assets have finished"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfk$1$1;->zzBI:Lcom/google/android/gms/internal/zzfk$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfk$1;->zzBH:Lcom/google/android/gms/internal/zzfk;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfk;->zzBE:Ljava/util/Set;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfk$1$1;->zzrZ:Landroid/webkit/WebView;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    const-string v0, "Loading assets have failed."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfk$1$1;->zzBI:Lcom/google/android/gms/internal/zzfk$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfk$1;->zzBH:Lcom/google/android/gms/internal/zzfk;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfk;->zzBE:Ljava/util/Set;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfk$1$1;->zzrZ:Landroid/webkit/WebView;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method
