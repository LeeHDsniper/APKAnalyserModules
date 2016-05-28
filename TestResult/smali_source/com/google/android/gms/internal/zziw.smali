.class public final Lcom/google/android/gms/internal/zziw;
.super Lcom/google/android/gms/internal/zziu;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzip;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zziu;-><init>(Lcom/google/android/gms/internal/zzip;)V

    return-void
.end method


# virtual methods
.method public onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "requestedOrientation"    # I
    .param p3, "customViewCallback"    # Landroid/webkit/WebChromeClient$CustomViewCallback;

    .prologue
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/internal/zziw;->zza(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V

    return-void
.end method
