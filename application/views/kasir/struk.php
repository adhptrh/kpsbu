<?php if ($this->session->flashdata("invoice")) { ?>
    <div class="modal fade" id="struks" tabindex="-1" role="dialog" aria-labelledby="struks" aria-hidden="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title" id="exampleModalLabel">Struk</h5>
            </div>
                <div class="modal-body">

                   <iframe style="border:none;" width="100%" height="500px" src="<?php echo base_url("/kasir/pdfpreview/".$this->session->flashdata("invoice")) ?>">

                   </iframe>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="prnt" class="btn btn-primary">Print</button>
                </div>
            </div>
        </div>
    </div>
<?php } ?>